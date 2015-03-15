class DispensaryMenu < ActiveRecord::Base
  belongs_to :dispensary
  has_many :dispensary_products
  has_many :specials

  serialize :menu_data, JSON
  serialize :specials_data, JSON


  # def initialize(*args)
  #   # if self.new_record?
  #   # super(args)
  # end

  # def menu
  #   a = []
  #   menu_data.each do |m|
  #     a << build_dispensary_product_from_leafly(m)
  #   end
  #   a.group_by{ |p| p.product_type }
  # end
  #
  # def specials
  #   specials_data.map{ |s| build_special_from_leafly(s) }
  # end


  # def menu_data
  #   if read_attribute(:menu_data).nil?
  #     data = leafly_connection.menu(leafly_slug)
  #     write_attribute(:menu_data, data)
  #   else
  #     #updates menu at the frequency specified in :update_frequency
  #     if Time.now > updated_at + update_frequency.seconds
  #       data = leafly_connection.menu(leafly_slug)
  #       update_attribute(:menu_data, data)
  #     else
  #       data = read_attribute(:menu_data)
  #     end
  #   end
  #
  #   data
  # end


  #
  # def build_special_from_leafly(special_hash)
  #   Special.new(name: special_hash['title'], description: special_hash['details'], fine_print: special_hash['finePrint'])
  # end
  #
  # def populate_from_leafly!
  #   leafly_product_array.each do |p|
  #     dp = self.dispensary_products.find_or_build_from_leafly_hash(p)
  #     self.dispensary_products << dp if dp.new_record?
  #   end
  #   self
  # end
  #
  # def leafly_product_array
  #   dispensary.leafly_connection.menu(dispensary.leafly_slug)
  # end
  #
  # def sorted_menu_hash
  #   dispensary_products.group_by{ |p| p.product_type }
  # end
  #
  # def update_menu_data_from_leafly
  #
  # end

end
