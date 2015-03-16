module LeaflyMenuBridge
  def quick_menu
    a = []
    menu_data.each do |m|
      a << DispensaryProduct.build_dispensary_product_from_leafly(m)
    end
    a.group_by{ |p| p.product_type }
  end

  def quick_specials
    specials_data.map{ |s| Special.build_special_from_leafly(s) }
  end
end