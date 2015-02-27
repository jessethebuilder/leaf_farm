class AddUpdateFrequencyToDispensary < ActiveRecord::Migration
  def change
    add_column :dispensaries, :update_frequency, :integer
  end
end
