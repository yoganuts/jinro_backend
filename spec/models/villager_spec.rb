# == Schema Information
#
# Table name: villagers
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  code       :string(255)
#  image_no   :integer          default(0)
#  village_id :bigint(8)
#  role_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Villager, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:village) }
    it { is_expected.to belong_to(:role) }
    it { is_expected.to have_many(:talks).dependent(:destroy) }
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end

  describe '#set_initial_value' do
    context 'when create' do
      subject { described_class.new(params) }
      context 'when code is null' do
        context 'when role villager is nothing' do
          let(:params) { { code: nil, role: nil } }
          it do
            expect(subject.code).not_to be_nil
            expect(subject.role).to be_nil
          end
        end
        context 'when role villager exists' do
          let(:params) { { code: nil, role: create(:role, code: :villager) } }
          it do
            expect(subject.code).not_to be_nil
            expect(subject.role.code).to eq 'villager'
          end
        end
      end
      context 'when code & role are not null' do
        let(:params) { { code: :foo, role: create(:role, code: :bar) } }
        it do
          expect(subject.code).to eq 'foo'
          expect(subject.role.code).to eq 'bar'
        end
      end
    end
    context 'when update' do
      subject { described_class.first }
      before { create(:villager, village: create(:village), role: create(:role, code: :foo)) }
      it { expect(subject.role.code).to eq 'foo' }
    end
  end

  describe 'after_create_commit' do
    # FIXME
  end
end
