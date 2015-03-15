module LeaflyProductBridge
  def build_dispensary_product_from_leafly(leafly_hash)
    dp = DispensaryProduct.new
    dp.source = 'leafly'
    dp.name = leafly_hash['name']
    dp.description = leafly_hash['description']
    dp.product_type = leafly_hash['type']
    dp.source_image_path = leafly_hash['imagePath']
    dp.pricing_array = leafly_hash['pricing']
    if leafly_hash['strainInfo']
      dp.slug = leafly_hash['strainInfo']['slug']
      dp.rating = leafly_hash['strainInfo']['rating']
      dp.rating_count = leafly_hash['strainInfo']['ratingCount']
      dp.category = leafly_hash['strainInfo']['category']
    end

    dp
  end
end