module LeaflyBridge
  #Where all the hacks go to set up the connections between Leafly and Dispensary, Menu, etc. objects.

  #validate leafly_slug
  #has_one :leafly_connection

  def self.included(klass)
     klass.class_eval do

       has_one :leafly_connection, :as => :leafly_connectable

       #main access for methods in this module.
       define_singleton_method(:find_or_build_from_leafly) do |slug, leafly_connection, update_frequency: 3600|

       #this find method also manages data updates from Leafly, based on :update_frequency
       #does not save the record if :new_record?, but does if not.
       dispensary = Dispensary.where(:leafly_slug => slug).first || Dispensary.new(:leafly_slug => slug, :update_frequency => update_frequency)

        #attach a LeaflyConnection to this Dispensary, if one does not exist
        dispensary.leafly_connection ||= leafly_connection

        #get new data Dispensary if none exists, or if the time has gone beyond update_frequency
        if dispensary.new_record? || Time.now > dispensary.updated_at + dispensary.update_frequency.seconds
          dispensary.send(:populate_dispensary!)
          unless dispensary.new_record?
            dispensary.touch
            dispensary.save
          end
        end

        dispensary
      end
    end
  end

  def menu
    a = []
    menu_data.each do |m|
      a << build_dispensary_product_from_leafly(m)
    end
    a.group_by{ |p| p.product_type }
  end

  def specials
    specials_data.map{ |s| build_special_from_leafly(s) }
  end

  private

  def menu_data
    if read_attribute(:menu_data).nil?
      data = leafly_connection.menu(leafly_slug)
      write_attribute(:menu_data, data)
    else
      #updates menu at the frequency specified in :update_frequency
      if Time.now > updated_at + update_frequency.seconds
        data = leafly_connection.menu(leafly_slug)
        update_attribute(:menu_data, data)
      else
        data = read_attribute(:menu_data)
      end
    end

    data
  end


  def build_special_from_leafly(special_hash)
    Special.new(name: special_hash['title'], details: special_hash['details'], fine_print: special_hash['finePrint'])
  end

  #--------------------------Attribute Translation Hacks-------------------------------------
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


  def populate_dispensary!
    raise ArgumentError, 'Dispensary has not Leafly Slug' if self.leafly_slug.nil?

    d = leafly_connection.details(self.leafly_slug)
    self.name = d['name']
    self.atm = d['atm']
    self.credit = d['creditCards']
    self.veterans_discount = d['veteransDiscount']
    self.ada = d['ada']
    self.specials_data = d['specialsList']


    self
  end

end