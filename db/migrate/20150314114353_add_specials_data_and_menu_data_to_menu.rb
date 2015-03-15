class AddSpecialsDataAndMenuDataToMenu < ActiveRecord::Migration
  def changes
    add_column :menus, :specials_data, :text
    add_column :menus, :menu_data, :text
  end
end
