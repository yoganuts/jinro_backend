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
    it { is_expected.to have_many(:villagers).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:villagers).allow_destroy(true) }
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
        let(:params) { { code: nil } }
        it do
          expect(subject.code).not_to be_nil
        end
      end
      context 'when code is not null' do
        let(:params) { { code: :foo } }
        it do
          expect(subject.code).to eq 'foo'
        end
      end
    end
  end
end
