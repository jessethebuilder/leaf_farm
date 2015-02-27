module LeaflyBridge
  #Where all the hacks go to set up the connections between Leafly and Dispensary, Menu, etc. objects.
  #
  # def included
  #   # class_eval do
  #   class_eval{
  #     has_one :leafly_connection, :as => :leafly_connectable
  #
  #   }
  #   # end
  # end

  def menu
    a = []
    menu_data.each do |m|
      a << build_dispensary_product_from_leafly_hash(m)
    end
    a.group_by{ |p| p.product_type }
  end

  def menu_data
    #updates menu at the frequency specified in :update_frequency
    if Time.now > updated_at + update_frequency.seconds
      data = leafly_connection.menu(leafly_slug)
      update_attribute(:menu_data, data)
    end
    data
  end

  private

  def self.build_dispensary_product_from_leafly_hash(leafly_hash)
    dp = DispensaryProduct.new
    dp.populate_dispensary_menu_from_leafly_hash!(leafly_hash)
  end

  def populate_dispensary_menu_from_leafly_hash(leafly_hash)
    self.source = 'leafly'
    self.name = leafly_hash['name']
    self.description = leafly_hash['description']
    self.product_type = leafly_hash['type']
    self.source_image_path = leafly_hash['imagePath']
    self.pricing_array = leafly_hash['pricing']
    if leafly_hash['strainInfo']
      self.slug = leafly_hash['strainInfo']['slug']
      self.rating = leafly_hash['strainInfo']['rating']
      self.rating_count = leafly_hash['strainInfo']['ratingCount']
      self.category = leafly_hash['strainInfo']['category']
    end
    self
  end





  private

  def menu_data

  end

  def dispensary_data

  end

 ##################################################################
  # def build_quick_menu(slug)
  #   menu_data = menu(slug)
  #   yield menu_data if block_given?
  #   a = []
  #   menu_data.each do |m|
  #     a << DispensaryProduct.build_from_leafly_hash(m)
  #   end
  #   a.group_by{ |p| p.product_type }
  # end

  def build_dispensary(slug)
    d = Dispensary.new(:leafly_slug => slug)
    populate_dispensary!(d)
  end

  def populate_dispensary(dispensary)
    raise ArgumentError, 'Dispensary has not Leafly Slug' if dispensary.leafly_slug.nil?

    d = details(dispensary.leafly_slug)
    #dispensary.source = 'leafly'
    dispensary.name = d['name']
    dispensary.atm = d['atm']
    dispensary.credit = d['creditCards']
    dispensary.veterans_discount = d['veteransDiscount']
    dispensary.ada = d['ada']
    dispensary
  end
end