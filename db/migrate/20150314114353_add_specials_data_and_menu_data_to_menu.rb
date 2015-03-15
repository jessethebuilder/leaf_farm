class AddSpecialsDataAndMenuDataToMenu < ActiveRecord::Migration
  def changes
    add_column :dispensary_menus, :specials_data, :text
    add_column :dispensary_menus, :menu_data, :text
  end
end
