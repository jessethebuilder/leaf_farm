class CreatePatientProfiles < ActiveRecord::Migration
  def change
    create_table :patient_profiles do |t|
      t.string :state_id
      t.string :certification
      t.date :state_id_expires
      t.date :certification_expires
      t.text :symptoms, :default => []

      t.string :sex
      t.string :first_name
      t.string :middle_name
      t.string :last_name

      t.integer :has_patient_profile_id
      t.string :has_patient_profile_type

      t.timestamps null: false
    end
  end
end
