class Dispensary < ActiveRecord::Base
  include LeaflyBridge

  has_one :contact_info, :as => :has_contact_info

  # has_one :dispensary_menu

  validates :name, presence: true

  serialize :menu_data, JSON
  serialize :specials_data, JSON
  serialize :photo_urls, JSON
  serialize :reviews_data, JSON
end