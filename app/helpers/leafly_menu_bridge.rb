module LeaflyMenuBridge
  def quick_menu
    a = []
    menu_data.each do |m|
      a << DispensaryProduct.build_dispensary_product_from_leafly(m)
    end
    menu_hash = a.group_by{ |p| p.product_type }
    order_menu(menu_hash)
  end



  def quick_specials
    specials_data.map{ |s| Special.build_special_from_leafly(s) }
  end

  def has_specials?
    !specials_data.blank?
  end

  def sections
    a = []
    a.push('Specials') if has_specials?
    a + quick_menu.keys
  end

  private

  def order_menu(menu_hash)
    h = {}
    h['Flower'] = menu_hash.delete('Flower')
    other = menu_hash.delete('Other')
    h.merge(menu_hash).merge({'Other' => other})
  end
end