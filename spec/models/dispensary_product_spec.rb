require 'rails_helper'

describe DispensaryProduct do
  describe 'Validations' do
    it{ should validate_presence_of :name }
  end

  describe 'Associations' do
    it{ should belong_to :dispensary_menu }
  end
end