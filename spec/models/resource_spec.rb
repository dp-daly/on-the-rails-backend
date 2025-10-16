require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe 'validations' do
    subject { build(:resource) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_uniqueness_of(:link) }
  end
end
