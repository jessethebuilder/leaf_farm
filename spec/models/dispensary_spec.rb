require 'rails_helper'

describe Dispensary do
  #many more specs for Dispensary are in LeaflyBridge specs

  let(:dispensary){ build :dispensary }
  describe 'Validations' do
    it{ should validate_presence_of :name }
  end

  describe 'Associations' do
    it{ should have_one :contact_info }
  end

  describe 'Idioms' do
    # specify 'If #dispensary_menu is called, but none exists, a new one is sent' do
    #   dispensary.dispensary_menu.destroy unless dispensary.dispensary_menu.nil?
    #   dispensary.dispensary_menu.new_record?.should == true
    # end

    # it 'should create a new DispensaryMenu upon instantiation, if none exists' do
    #   d = Dispensary.new
    #
    # end

  describe 'Methods' do
    # describe '#menu' do
    #   it 'should return a new menu, if none exits on the Dispensary' do
    #     dispensary.menu.class =
    #   end
    end
  end
end