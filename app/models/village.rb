# frozen_string_literal: true

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

class Village < ApplicationRecord
  has_many :villagers, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
