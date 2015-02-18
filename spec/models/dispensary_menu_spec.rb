require 'rails_helper'

describe DispensaryMenu do
  describe 'Validations' do
    it{ should validate_presence_of :dispensary_id }
  end

  describe 'Associations' do
    it{ should have_many :dispensary_products }
    it{ should belong_to :dispensary }
  end

end