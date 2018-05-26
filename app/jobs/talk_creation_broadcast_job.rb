# frozen_string_literal: true

class TalkCreationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(talk)
    ActionCable.server.broadcast(
      'talk_channel',
      id: talk.id,
      content: talk.content,
      created_at: talk.created_at.strftime('%H:%M')
    )
  end
end
