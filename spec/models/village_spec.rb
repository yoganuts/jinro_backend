RSpec.describe Village, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:villager) }
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end
end
