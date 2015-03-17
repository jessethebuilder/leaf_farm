require 'leaf_farm'

class LeaflyConnection < ActiveRecord::Base
  belongs_to :leafly_connectable, polymorphic: true

  validates :app_id, presence: true
  validates :app_key, presence: true

  def location(slug: nil)
    LeaflyLocation.new(app_id, app_key, location_slug: slug, app_name: app_name)
  end

  def menu(slug)
    JSON.parse(location(slug: slug).menu)
  end

  def details(slug)
    JSON.parse(location(slug: slug).details)
  end

  def search_locations(latitude, longitude, take: 50, page: 0)
    results = JSON.parse(location.search(latitude, longitude, take: take, page: page))
    results['stores']
  end
end
