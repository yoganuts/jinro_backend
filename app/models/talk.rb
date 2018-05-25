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
  belongs_to :villager

  validates :content, presence: true
end
