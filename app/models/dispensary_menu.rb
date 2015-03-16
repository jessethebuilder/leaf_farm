class DispensaryMenu < ActiveRecord::Base
  include LeaflyMenuBridge

  belongs_to :dispensary
  has_many :dispensary_products
  has_many :specials

  serialize :menu_data, JSON
  serialize :specials_data, JSON
end
