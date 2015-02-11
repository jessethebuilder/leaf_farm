class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :leafly_connection_id

      t.timestamps
    end
  end
end
