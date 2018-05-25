# == Schema Information
#
# Table name: villagers
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  code       :string(255)
#  village_id :bigint(8)
#  role_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
