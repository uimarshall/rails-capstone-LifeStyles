require 'rails_helper'
RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:votes).class_name('Vote') }
    it { should have_many(:article_categories) }
    it { should have_many(:categories) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:image) }

    it do
      should validate_length_of(:text)
        .is_at_least(3)
    end
    it do
      should validate_length_of(:title)
        .is_at_least(3)
    end
  end
end
