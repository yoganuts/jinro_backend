# frozen_string_literal: true
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

class Villager < ApplicationRecord
  belongs_to :village
  belongs_to :role
  has_many :talks, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  after_create_commit do
    VillagerCreationBroadcastJob.perform_later(self)
    self.village.talks.create(content: "#{self.name}が参加しました")
  end

  after_initialize :set_initial_value, if: :new_record?

  def set_initial_value
    self.code = SecureRandom.base64(16) if code.blank?
    self.role = Role.find_by(code: :villager) if role.blank? && Role.where(code: :villager).exists?
  end
end
