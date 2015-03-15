class AddDataColumnsToDispensaryMenu < ActiveRecord::Migration
  def change
    add_column :dispensary_menus, :menu_data, :text
    add_column :dispensary_menus, :specials_data, :text

    remove_column :dispensaries, :menu_data, :text
    remove_column :dispensaries, :specials_data, :text
  end
end
