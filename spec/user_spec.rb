require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('userexample.com').for(:email) }
    it { should validate_presence_of(:user_type) }
    it { should validate_inclusion_of(:user_type).in_array(%w(Artisan Buyer)) }
  end

  describe 'associations' do
    it { should have_many(:artisans) }
    it { should have_many(:products).through(:artisans) }
    it { should have_many(:orders) }
    it { should have_many(:reviews) }
  end
end