# spec/models/order_item_spec.rb

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).is_greater_than(0) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_numericality_of(:unit_price).is_greater_than(0) }
  end

  describe 'associations' do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
  end
end
