# == Schema Information
#
# Table name: villages
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  code       :string(255)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
