require 'rails_helper'
#LeaflyBridge gets included on Dispensary. All of these specs track the effects of that include.

describe Dispensary do
  let(:test_slug){ 'green-orchard' }
  let(:leafly_connection){ create :leafly_connection }
  let(:dispensary){ create :leafly_dispensary }

  describe 'Validations' do
    it{ should validate_presence_of :leafly_slug }
  end

  describe 'Associations' do
    it{ should have_one :leafly_connection }
  end

  describe 'Class Methods' do
    describe '#find_or_build_from_leafly' do
      it 'should return a new Dispensary record, if one does not exist that matches the slug' do
        d = Dispensary.find_or_build_from_leafly(test_slug, leafly_connection)
        d.class.should == Dispensary
        d.new_record?.should == true
      end

      it 'should return an existing Dispensary, if one matches the slug' do
        dispensary.leafly_slug = test_slug
        dispensary.save
        Dispensary.find_or_build_from_leafly(test_slug, leafly_connection).should == dispensary
      end
    end
  end
end