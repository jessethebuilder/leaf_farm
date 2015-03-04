class AddReviewsDataToDispensary < ActiveRecord::Migration
  def change
    add_column :dispensaries, :reviews_data, :text
  end
end
