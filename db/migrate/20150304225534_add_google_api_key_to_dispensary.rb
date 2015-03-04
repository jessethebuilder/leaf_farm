class AddGoogleApiKeyToDispensary < ActiveRecord::Migration
  def change
    add_column :dispensaries, :google_api_key, :string
  end
end
