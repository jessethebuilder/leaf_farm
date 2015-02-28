class Dispensary < ActiveRecord::Base
  include LeaflyBridge
  has_one :leafly_connection, :as => :leafly_connectable

  has_one :contact_info, :as => :has_contact_info

  # has_one :dispensary_menu

  validates :name, presence: true

  serialize :menu_data, JSON
end

class Special
  attr_accessor :name, :description, :fine_print
end

class Review

end
