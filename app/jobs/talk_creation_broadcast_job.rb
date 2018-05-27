# frozen_string_literal: true

class TalkCreationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(talk)
    ActionCable.server.broadcast(
      "talk_#{talk.villager.village_id}",
      id: talk.id,
      villager_id: talk.villager_id,
      content: talk.content,
      created_at: talk.created_at,
      villager: talk.villager.as_json
    )
  end
end
