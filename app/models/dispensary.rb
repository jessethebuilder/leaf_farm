class Dispensary < ActiveRecord::Base
  has_one :leafly_connection, :as => :leafly_connectable
  has_one :contact_info, :as => :has_contact_info

  has_one :dispensary_menu
  #after_create{ |r| associate_dispensary_menu(r) }
  #def associate_dispensary_menu(record)
  #  if record.dispensary_menu.nil?
  #    record.dispensary_menu = DispensaryMenu.new
  #    dispensary_menu.save
  #  end
  #end

  #def initialize(*args)
  #  self.dispensary_menu = DispensaryMenu.new if self.dispensary_menu.nil?
  #  super(*args)
  #end

  validates :name, presence: true

  def menu
    dispensary_menu.populate_from_leafly!
  end

  def self.find_or_build_from_leafly_slug(slug)
    find_from_leafly_slug(slug) || build_from_leafly_slug(slug)    
  end
  
  def self.find_from_leafly_slug(slug)
    d = where(:leafly_slug => slug).first
    if d && d.send(:update_leafly?)
      d.populate_from_leafly!
      d.save
    end
    d
  end

  def self.build_from_leafly_slug(slug)
    d = Dispensary.new(:leafly_slug => slug)
    d.leafly_connection = generic_connection_object
    d.populate_from_leafly!    
  end

  def populate_from_leafly!
    d = self.leafly_connection.details(self.leafly_slug)
    self.name = d['name']
    self.atm = d['atm']
    self.credit = d['creditCards']
    self.veterans_discount = d['veteransDiscount']
    self.ada = d['ada']
    self
  end

  #def
  
  private

  def self.generic_connection_object
    #override
    LeaflyConnection.first
  end
  
  def update_leafly?
    #override this if necessary
    #self.updated_at + 8.hours < Time.now
    true
  end


end

class Special
  attr_accessor :name, :description, :fine_print
end

class Review

end
