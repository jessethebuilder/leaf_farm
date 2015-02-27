require 'rails_helper'

describe 'LeaflyConnection Requests' do
  let(:lc){ build :leafly_connection }

  describe '#location()' do
    it 'should return a successful status' do
      lc.location()

    end

    it 'should return a JSon object' do

    end
  end
end