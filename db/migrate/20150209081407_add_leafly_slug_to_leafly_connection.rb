class AddLeaflySlugToLeaflyConnection < ActiveRecord::Migration
  def change
    add_column :leafly_connections, :leafly_slug, :string
  end
end
