require 'rails_helper'

RSpec.describe Artisan, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:artisan_name) }
    it { should validate_presence_of(:location) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:products) }
  end
end
