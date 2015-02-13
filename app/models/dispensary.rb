class Dispensary
  attr_accessor :name, :logo_url, :description, :cover_photo_url, :photo_urls, :tagLine, :tagLineBlurb,
                :commerce_options, :specials

  def initialize()
    @specials = []
  end

  def self.create_with_leafly_details_hash(leafly_hash)
    d = Dispensary.new
    d.name = leafly_hash['name']

    #d.specials = []

    if leafly_hash['specialsList']
      leafly_hash['specialsList'].each do |special|
        s = Special.new
        s.name = special['title']
        s.description = special['details']
        s.fine_print = special['finePrint']
        d.specials << s
      end
    end

    d
  end

  class CommerceOptions
    attr_accessor :atm, :credit, :veterans_discount, :ada, :delivery, :retail, :medical, :hours
  end

  class ContactInfo
    attr_accessor :address1, :address2, :city, :state, :zip, :phone, :website_url,
                  :facebook_url, :twitter_url, :google_plus_url, :pinterest_url, :tumblr_url, :instagram_url
  end

  class Special
    attr_accessor :name, :description, :fine_print
  end

  class Review

  end
end

