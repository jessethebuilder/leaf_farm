class AddSpecialsDataToDispensary < ActiveRecord::Migration
  def change
    add_column :dispensaries, :specials_data, :text
  end
end
