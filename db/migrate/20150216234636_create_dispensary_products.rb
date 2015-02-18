class CreateDispensaryProducts < ActiveRecord::Migration
  def change
    create_table :dispensary_products do |t|
      t.string :source
      t.string :name
      t.text :description
      t.string :product_type
      t.string :source_image_path
      t.text :pricing_array
      t.string :slug
      t.string :rating
      t.string :rating_count
      t.string :category

      t.timestamps
    end
  end
end
