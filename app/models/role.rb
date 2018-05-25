# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  has_many :villager

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
