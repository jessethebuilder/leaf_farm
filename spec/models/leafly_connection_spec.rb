require 'rails_helper'

describe LeaflyConnection do
  describe 'Validations' do
    it{ should validate_presence_of :app_id }
    it{ should validate_presence_of :key }
  end
end