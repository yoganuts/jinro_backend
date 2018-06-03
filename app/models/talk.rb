# frozen_string_literal: true

# == Schema Information
#
# Table name: talks
#
#  id          :bigint(8)        not null, primary key
#  villager_id :bigint(8)
#  content     :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Talk < ApplicationRecord
  belongs_to :village
  belongs_to :villager, optional: true

  validates :content, presence: true

  after_create_commit do
    TalkCreationBroadcastJob.perform_later(self)
  end
end
