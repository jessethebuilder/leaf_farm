module LeaflyDispensaryBridge
  #Where all the hacks go to set up the connections between Leafly and Dispensary, Menu, etc. objects.
  def self.included(klass)
    klass.class_eval do
      extend LeaflyDispensaryBridgeClassMethods

      has_one :leafly_connection, :as => :leafly_connectable
      validates :leafly_slug, :presence => true
    end
  end

  private

  def populate_dispensary!(leafly_connection)
    raise ArgumentError, 'Dispensary does not have a Leafly Slug' if self.leafly_slug.nil?
    # raise ArgumentError, 'Dispensary does not have a LeaflyConnection Object' if self.leafly_connection.nil?

    d = leafly_connection.details(self.leafly_slug)
    self.name = d['name']
    self.description = d['blurb']

    self.hours = d['hours']

    self.atm = d['atm']
    self.credit = d['creditCards']
    self.veterans_discount = d['veteransDiscount']
    self.ada = d['ada']

    self.delivery = d['delivery']
    self.retail = d['retail']
    self.medical = d['medical']
    self.store_front = d['storefront']

    self.logo_url = d['logo']
    self.photo_urls = d['photos']
    self.cover_photo_url = d['coverPhoto']
    self.tag_line = d['tagLine']
    self.tag_line_blurb = d['tagLineBlurb']


    self.contact_info = build_dispensary_contact_info(d)

    menu = self.dispensary_menu || self.build_dispensary_menu
    menu.menu_data = leafly_connection.menu(self.leafly_slug)
    menu.specials_data = d['specialsList']

    self
  end

  def build_dispensary_contact_info(details_hash)
    ci = ContactInfo.new
    ci.phone = details_hash['phone']
    ci.website_url = details_hash['wesbsite']

    sn = ci.build_social_networking_profile
    sn.facebook_url = details_hash['facebookUrl']
    sn.twitter_url = details_hash['twitterUrl']
    #todo add other social networking

    a = ci.build_address
    a.street = details_hash['address1']
    a.street2 = details_hash['address2']
    a.city = details_hash['city']
    a.state = details_hash['state']
    a.zip = details_hash['zip']

    ci
  end
end

module LeaflyDispensaryBridgeClassMethods
  def find_or_build_from_leafly(slug, leafly_connection, update_frequency: 3600)
    d = Dispensary.where(:leafly_slug => slug).first || Dispensary.new(:leafly_slug => slug)

    #populate, or repopulate the Dispensary object with data from Leafly.
    if d.new_record? || Time.now > d.updated_at + update_frequency
      d.send(:populate_dispensary!, leafly_connection)
      touch_and_update_record(d) unless d.new_record?
    end

    d
  end

  private

  def touch_and_update_record(d)
    d.touch
    d.save
  end
end