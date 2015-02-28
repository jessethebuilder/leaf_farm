require 'rails_helper'

describe 'LeaflyConnection Requests' do
  #these requests use the Leafly API, which offers a limited number of hits per day (420).

  let(:lc){ build :leafly_connection }
  let(:slug){ 'denver-relief' }

  describe '#menu()' do
    it 'should return an Array' do
      pending
      false
      # lc.menu(slug).class.should == Array
    end

  end
end