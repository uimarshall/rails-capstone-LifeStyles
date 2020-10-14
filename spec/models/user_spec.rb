require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }

    it { is_expected.to validate_presence_of(:password) }

    it { should have_secure_password }
    it do
      should validate_length_of(:password).
        is_at_least(7)
    end
    it do
      should validate_length_of(:username).
        is_at_least(3)
    end
    it 'should not save wrong inputs to database' do
      user = User.new(username: 'baba', password: 'pass').save
      expect(user).not_to eq(true)
    end
    it 'should save save right inputs to database' do
      user = User.new(username: 'baba', password: 'sample@example.com').save
      expect(user).to eq(true)
    end
  end
end
