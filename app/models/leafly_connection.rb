require 'leaf_farm'

class LeaflyConnection < ActiveRecord::Base
  belongs_to :leafly_connectable, polymorphic: true

  validates :app_id, presence: true

  validates :app_key, presence: true

  serialize :menu_data, JSON
  serialize :details_data, JSON

  def location(slug)
    LeaflyLocation.new(app_id, app_key, slug, :app_name => app_name)
  end

  def menu(slug, refresh: true)
    if refresh
      _menu =  raw_menu(slug)
      update_attribute(:menu_data, _menu)
      _menu
    else
      menu_data || menu(slug, fresh: true)
    end
  end

  def details(slug, refresh: true)
    if refresh
      _menu = raw_details(slug)
      update_attribute(:details_data, _menu)
      _menu
    else
      details_data || details(slug, refresh:true)
    end
  end

  def special_menu(slug)
    raw_menu(slug)
  end

  def special_details(slug)
    raw_details(slug)
  end

  private

  def raw_menu(slug)
    JSON.parse(location(slug).menu).group_by{ |i| i['type'] }
  end

  def raw_details(slug)
    JSON.parse(location(slug).details)
  end

end
