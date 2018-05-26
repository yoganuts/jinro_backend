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

FactoryBot.define do
  factory :villager do
    name 'MyString'
    sequence(:code) { |n| "code_#{n}" }
  end
end
