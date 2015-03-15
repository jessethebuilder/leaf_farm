class AddSpecialsDataToMenu < ActiveRecord::Migration
  def changes
    add_column :menus, :specials_data, :text
  end
end
