# frozen_string_literal: true

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

class Villager < ApplicationRecord
  belongs_to :village
  belongs_to :role
  has_many :talks, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
