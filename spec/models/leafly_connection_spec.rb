require 'rails_helper'

describe LeaflyConnection do
  #Many of these specs make api calls to Leafly, so they may be more condensed (specing for more than one thing) than
  #typcial specs.

  let(:leafly_connection){ build :leafly_connection }
  describe 'Validations' do
    it{ should validate_presence_of :app_id }
    it{ should validate_presence_of :app_key }

    # it{ should validate_presence_of :update_duration }
    # it{ should validate_numericality_of(:update_duration).is_greater_than_or_equal_to(0).only_integer }

    describe 'Methods' do
      let(:address){ build :real_address }

      describe '#search_locations' do
        it 'should return an array of store locations' do
          # leafly_connection.search_locations(address.latitude, address.longitude).class.should == Array
        end
      end
    end

  end
end