class AddMenuDataToLeaflyConnection < ActiveRecord::Migration
  def change
    add_column :leafly_connections, :menu_data, :text
  end
end
