class Dispensary < ActiveRecord::Base
  include LeaflyBridge
  has_one :leafly_connection, :as => :leafly_connectable

  has_one :contact_info, :as => :has_contact_info

  has_one :dispensary_menu

  validates :name, presence: true

  serialize :menu_data, JSON


  # after_initialize{ |r| r.dispensary_menu = DispensaryMenu.new if r.dispensary_menu.nil? }

  #update leafly if there is a leafly connection
  # after_initialize{ |r| r.update_leafly if leafly_connection}

  def update_leafly
    #todo put update_frequency as column here or maybe in LeaflyConnection. Maybe move all of this to LC.
    if updated_at + 8.hours
      leafly_connection.populate_dispensary(self)
      save
    end
  end

  def leafly_menu
    #todo
    # leafly_connection.build_quick_menu(leafly_slug){ |data| update_leafly_menu_data(data) }
    a = []
    menu_data.each do |m|
      a << DispensaryProduct.build_from_leafly_hash(m)
    end
    a.group_by{ |p| p.product_type }
  end

  def update_leafly_menu_data(data)
    if !new_record?
      update_attribute(:menu_data, data)
    end
  end

end

class Special
  attr_accessor :name, :description, :fine_print
end

class Review

end
