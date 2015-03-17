require 'rest-client'
require 'json'

class Mower
  ROOT_PATH = 'http://data.leafly.com'

  def initialize(app_id, app_key, app_name: nil)
    @leafly_id = app_id
    @leafly_key = app_key
    @leafly_name = app_name
  end

  def get(url)
    RestClient.get(url, auth_params)
  end

  private

  def auth_params
    {'app_id' => @leafly_id, 'app_key' => @leafly_key}
  end
end


class LeaflyLocation
  attr_accessor :mower, :leafly_location_slug

  def initialize(app_id, app_key, location_slug: nil, app_name: nil)
     @mower = Mower.new(app_id, app_key, app_name: app_name)
     @leafly_location_slug = location_slug
  end

  def menu
    @mower.get(locations_path + '/' + @leafly_location_slug + '/menu')
  end

  def details
    @mower.get(locations_path + '/' + @leafly_location_slug)
  end

  def search(latitude, longitude, take: 50, page: 0)
    #max for :take is 50
    #returns a hash with 3 keys. 'stores', 'pageingContext', and 'facets'
    @mower.get("#{locations_path}?page=#{page}&take=#{take}&latitude=#{latitude}&longitude=#{longitude}")
  end

  def search_from_address(address, take: 50, page: 0)
    address.geocode unless address.geocoded?
    raise ArgumentError 'Could not geocode that Address' if address.latitude.nil?
    search(address.latitude, address.longitude, take: take, page: page)
  end

  private

  def locations_path
    Mower::ROOT_PATH + "/locations"
  end

end
