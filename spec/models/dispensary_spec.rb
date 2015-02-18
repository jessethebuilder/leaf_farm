require 'rails_helper'

FactoryGirl.define do
  factory :dispensary do
    name Faker::Name.name
  end
end

describe Dispensary do
  let(:disp){ build :dispensary }
  describe 'Validations' do
    it{ should validate_presence_of :name }

  end

  describe 'Associations' do
    it{ should have_one :contact_info }
    it{ should have_one :leafly_connection }

    it{ should have_one :dispensary_menu }
  end


  describe 'Idioms' do
    it 'should create a DispensaryMenu if one is not created' do
      disp.save
      disp.dispensary_menu.should_not == nil
    end
  end
end