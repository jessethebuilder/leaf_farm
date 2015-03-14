require 'rails_helper'

describe Dispensary do
  #many more specs for Dispensary are in LeaflyBridge specs

  let(:disp){ build :dispensary }
  describe 'Validations' do
    it{ should validate_presence_of :name }
  end

  describe 'Associations' do
    it{ should have_one :contact_info }
  end

  describe 'Idioms' do
  end
end