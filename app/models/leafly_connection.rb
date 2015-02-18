require 'leaf_farm'

class LeaflyConnection < ActiveRecord::Base
  belongs_to :leafly_connectable, polymorphic: true

  validates :app_id, presence: true

  validates :app_key, presence: true

  def location(slug)
    LeaflyLocation.new(app_id, app_key, slug, :app_name => app_name)
  end

  def menu(slug)
    JSON.parse(location(slug).menu)
  end

  def details(slug)
    JSON.parse(location(slug).details)
  end

  def build_quick_menu(slug)
    menu_data = menu(slug)
    yield menu_data if block_given?
    a = []
    menu_data.each do |m|
      a << DispensaryProduct.build_from_leafly_hash(m)
    end
    a.group_by{ |p| p.product_type }
  end

  def build_dispensary(slug)
    d = Dispensary.new(:leafly_slug => slug)
    populate_dispensary!(d)
  end

  def populate_dispensary!(dispensary)
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
