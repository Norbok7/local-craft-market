# spec/models/product_spec.rb

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { should belong_to(:artisan) }
    it { should have_many(:order_items) }
    it { should have_many(:reviews) }
  end
end
