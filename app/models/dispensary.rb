class Dispensary < ActiveRecord::Base
  include LeaflyDispensaryBridge

  has_one :contact_info, :as => :has_contact_info, :dependent => :destroy

  has_one :dispensary_menu, :dependent => :destroy

  validates :name, presence: true


  # serialize :menu_data, JSON
  # serialize :specials_data, JSON
  serialize :photo_urls, JSON
  serialize :reviews_data, JSON
end