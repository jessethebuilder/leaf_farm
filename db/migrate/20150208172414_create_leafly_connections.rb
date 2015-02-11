class CreateLeaflyConnections < ActiveRecord::Migration
  def change
    create_table :leafly_connections do |t|
      t.string :app_id
      t.string :app_key
      t.string :app_name

      t.string :leafly_connectable_type
      t.integer :leafly_connectable_id

      t.timestamps
    end
  end
end
