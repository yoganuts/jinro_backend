RSpec.describe Villager, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:village) }
    it { is_expected.to belong_to(:role) }
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end
end
