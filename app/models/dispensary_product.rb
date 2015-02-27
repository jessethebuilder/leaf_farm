class DispensaryProduct < ActiveRecord::Base
  #attr_accessor :source, :name, :description, :rating, :rating_count,
  #              :source_image_path, :product_image_path, :category, :slug,
  #              :product_type, :pricing_array
  serialize :pricing_array, JSON

  belongs_to :dispensary_menu

  validates :name, :presence => true

  def self.find_or_build_from_leafly_hash(leafly_hash)
    find_from_leafly_hash(leafly_hash) || build_from_leafly_hash(leafly_hash)
  end

  def self.find_from_leafly_hash(leafly_hash)
    dp = self.where(:name => leafly_hash['name']).first
    dp.populate_from_leafly_hash!(leafly_hash) if dp && dp.send(:update_leafly?)
    dp
  end
  #
  # def self.build_from_leafly_hash(leafly_hash)
  #   dp = self.new
  #   dp.populate_from_leafly_hash!(leafly_hash)
  # end
  #
  # def populate_from_leafly_hash!(leafly_hash)
  #   self.source = 'leafly'
  #   self.name = leafly_hash['name']
  #   self.description = leafly_hash['description']
  #   self.product_type = leafly_hash['type']
  #   self.source_image_path = leafly_hash['imagePath']
  #   self.pricing_array = leafly_hash['pricing']
  #   if leafly_hash['strainInfo']
  #     self.slug = leafly_hash['strainInfo']['slug']
  #     self.rating = leafly_hash['strainInfo']['rating']
  #     self.rating_count = leafly_hash['strainInfo']['ratingCount']
  #     self.category = leafly_hash['strainInfo']['category']
  #   end
  #   self
  # end

  def has_source_image?
    not source_image_path.nil?
  end

  def has_product_image?
    not product_image_path.nil?
  end

  def has_rating?
    not rating.nil?
  end

  private

  def update_leafly?
    true
  end
end