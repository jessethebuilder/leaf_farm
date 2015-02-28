require 'leaf_farm'

class LeaflyConnection < ActiveRecord::Base
  belongs_to :leafly_connectable, polymorphic: true

  validates :app_id, presence: true
  validates :app_key, presence: true

  def location(slug)
    LeaflyLocation.new(app_id, app_key, slug, :app_name => app_name)
  end

  def menu(slug)
    JSON.parse(location(slug).menu)
  end

  def details(slug)
    JSON.parse(location(slug).details)
  end
end
