class AddDetailsDataToLeaflyConnection < ActiveRecord::Migration
  def change
    add_column :leafly_connections, :details_data, :text
  end
end
