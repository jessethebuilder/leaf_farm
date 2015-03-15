class AddDispensaryMenuIdToSpecials < ActiveRecord::Migration
  def change
    add_column :specials, :dispensary_menu_id, :integer
  end
end
