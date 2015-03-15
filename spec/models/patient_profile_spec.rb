require 'rails_helper'

RSpec.describe PatientProfile, type: :model do
  describe 'Validations' do
    it{ should validate_presence_of :first_name }
    it{ should validate_presence_of :last_name }

    it{ should validate_presence_of :sex }
    it{ should validate_inclusion_of(:sex).in_array(['M', 'F']) }
  end

  describe 'Associations' do
    it{ should have_many :farm_notes }
    it{ should have_one :contact_info }
  end
end
