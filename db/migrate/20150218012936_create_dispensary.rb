class CreateDispensary < ActiveRecord::Migration
  def change
    create_table :dispensaries do |t|
      t.string :name
      t.string :logo_url
      t.text :description
      t.string :cover_photo_url
      t.text :photo_urls
      t.string :tag_line
      t.string :tag_line_blurb

      t.text :details_data
      t.text :menu_data

      t.string :leafly_slug

      t.timestamps
    end
  end
end
