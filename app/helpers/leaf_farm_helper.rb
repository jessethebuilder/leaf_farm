module LeafFarmHelper
  LEAFLY_ROOT = 'http://www.leafly.com'

  def leafly_strain_url(dispensary_product)
    "#{LEAFLY_ROOT}/#{dispensary_product.categor}/#{dispensary_product.slug}"
  end

  def leafly_location_url(slug)
    "http://www.leafly.com/dispensary-info/#{slug}"
  end
end