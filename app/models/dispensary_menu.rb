class DispensaryMenu < ActiveRecord::Base
  belongs_to :dispensary
  has_many :dispensary_products

  #validates :dispensary_id, :presence => true

  def populate_from_leafly!
    leafly_product_array.each do |p|
      dp = self.dispensary_products.find_or_build_from_leafly_hash(p)
      self.dispensary_products << dp if dp.new_record?
    end
    self
  end

  def leafly_product_array
    dispensary.leafly_connection.menu(dispensary.leafly_slug)
  end

  def sorted_menu_hash
    dispensary_products.group_by{ |p| p.product_type }
  end
end
