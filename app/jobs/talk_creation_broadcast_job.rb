# frozen_string_literal: true

class TalkCreationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(talk)
    ActionCable.server.broadcast(
      'talk_channel',
      id: talk.id,
      villager_id: talk.villager_id,
      content: talk.content,
      created_at: talk.created_at
    )
  end
end
