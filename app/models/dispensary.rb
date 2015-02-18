class Dispensary < ActiveRecord::Base
  has_one :leafly_connection, :as => :leafly_connectable
  has_one :contact_info, :as => :has_contact_info

  has_one :dispensary_menu
  after_initialize{ |r| r.dispensary_menu = DispensaryMenu.new if r.dispensary_menu.nil? }
  after_initialize{ |r| r.update_leafly }

  validates :name, presence: true

  serialize :menu_data, JSON

  def update_leafly
    if !new_record? && leafly_connection
      #todo
      leafly_connection.populate_dispensary!(self)
      save
    end
  end

  def leafly_menu
    leafly_connection.build_quick_menu(leafly_slug){ |data| update_leafly_menu_data(data) }
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
