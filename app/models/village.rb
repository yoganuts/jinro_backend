# frozen_string_literal: true
# == Schema Information
#
# Table name: villages
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  code       :string(255)
#  status     :integer
#  image_no   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Village < ApplicationRecord
  has_many :villagers, dependent: :destroy
  accepts_nested_attributes_for :villagers, allow_destroy: true
  has_many :talks, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  after_create_commit do
    VillageCreationBroadcastJob.perform_later(self)
  end

  after_initialize :set_initial_value, if: :new_record?

  def set_initial_value
    self.code = SecureRandom.base64(16) if code.blank?
  end
end
