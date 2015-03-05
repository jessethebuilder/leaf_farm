module LeafFarmHelper
  LEAFLY_ROOT = 'http://www.leafly.com'

  def leafly_strain_url(dispensary_product)
    "#{LEAFLY_ROOT}/#{dispensary_product.category.to_s.downcase}/#{dispensary_product.slug}"
  end

  def leafly_location_url(slug)
    "http://www.leafly.com/dispensary-info/#{slug}"
  end

  def leafly_menu_url(slug)
    "#{leafly_location_url(slug)}/menu"
  end

  #-------------Leafly Helpers-----------------------------

  def leafly_logo_link(size = :large)
    link_to image_tag(asset_url("leaf_farm/leafly/leafly_logo_#{size.to_s}.png")), 'http://www.leafly.com', :target => '_blank'
  end


end