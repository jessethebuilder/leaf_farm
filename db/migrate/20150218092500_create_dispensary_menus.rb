class CreateDispensaryMenus < ActiveRecord::Migration
  def change
    create_table :dispensary_menus do |t|
      t.integer :dispensary_id

      t.timestamps
    end
  end
end
