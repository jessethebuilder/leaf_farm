#This may be commented out because the specs make calls to the Leafly API, which is limited.
#Uncomment and get these specs to pass, before you claim you're a real baller.

require 'rails_helper'

describe 'LeaflyConnection Requests' do
  let(:lc){ build :leafly_connection }
  let(:slug){ 'denver-relief' }

  describe '#menu()' do
    it 'should return an Array' do
      # lc.menu(slug).class.should == Array
    end

  end
end