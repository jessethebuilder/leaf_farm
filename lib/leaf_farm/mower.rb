require 'rest-client'
require 'json'

class Mower
  ROOT_PATH = 'http://data.leafly.com'

  def initialize(app_id, app_key, app_name: nil)
    #@leafly_location = location
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

  def initialize(app_id, app_key, location_slug, app_name: nil)
     @mower = Mower.new(app_id, app_key, app_name: app_name)
     @leafly_location_slug = location_slug
  end

  def menu
    @mower.get(locations_path + @leafly_location_slug + '/menu')
  end

  private

  def locations_path
    Mower::ROOT_PATH + "/locations/"
  end

end
