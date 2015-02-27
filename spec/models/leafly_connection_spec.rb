require 'rails_helper'

describe LeaflyConnection do
  describe 'Validations' do
    it{ should validate_presence_of :app_id }
    it{ should validate_presence_of :app_key }

    # it{ should validate_presence_of :update_duration }
    # it{ should validate_numericality_of(:update_duration).is_greater_than_or_equal_to(0).only_integer }


  end
end