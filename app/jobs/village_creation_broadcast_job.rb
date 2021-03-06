# frozen_string_literal: true

class VillageCreationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(village)
    ActionCable.server.broadcast(
      'village',
      id: village.id,
      name: village.name,
      image_no: village.image_no,
      villagers: village.villagers.as_json
    )
  end
end
