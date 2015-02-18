class AddDispensaryMenuIdToDispensaryProduct < ActiveRecord::Migration
  def change
    add_column :dispensary_products, :dispensary_menu_id, :integer
  end
end
