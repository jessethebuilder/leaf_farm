class DispensaryProduct
  attr_accessor :source, :name, :description, :rating, :rating_count,
                :source_image_path, :product_image_path, :category, :slug,
                :product_type, :pricing_array

  def self.create_with_leafly_product_hash(leafly_hash)
    dp = self.new
    dp.source = 'leafly'
    dp.name = leafly_hash['name']
    dp.description = leafly_hash['description']
    dp.category = leafly_hash['category']
    dp.slug = leafly_hash['slug']
    #[:name, :description, :category, :slug].each{ |attr| dp.send(attr, leafly_hash[:slug]) }
    dp.source_image_path = leafly_hash['imagePath']
    dp.pricing_array = leafly_hash['pricing']
    if leafly_hash['strainInfo']
      dp.rating = leafly_hash['strainInfo']['rating']
      dp.rating_count = leafly_hash['strainInfo']['ratingCount']
      dp.product_type = leafly_hash['strainInfo']['category']
    end

    dp
  end

  def has_source_image?
    not source_image_path.nil?
  end

  def has_product_image?
    not product_image_path.nil?
  end

  def has_rating?
    not rating.nil?
  end
end