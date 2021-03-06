# == Schema Information
#
# Table name: talks
#
#  id          :bigint(8)        not null, primary key
#  villager_id :bigint(8)
#  village_id  :bigint(8)
#  content     :text(65535)
#  stamp_no    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

RSpec.describe Talk, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:village) }
    it { is_expected.to belong_to(:villager) }
  end
end
