class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.string :name
      t.text :description
      t.string :fine_print

      t.timestamps null: false
    end
  end
end
