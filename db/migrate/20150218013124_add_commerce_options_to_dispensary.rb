class AddCommerceOptionsToDispensary < ActiveRecord::Migration
  def change
    add_column :dispensaries, :atm, :boolean
    add_column :dispensaries, :credit, :boolean
    add_column :dispensaries, :veterans_discount, :boolean
    add_column :dispensaries, :store_front, :boolean
    add_column :dispensaries, :ada, :boolean
    add_column :dispensaries, :delivery, :boolean
    add_column :dispensaries, :retail, :boolean
    add_column :dispensaries, :medical, :boolean
    add_column :dispensaries, :hours, :text
  end
end
