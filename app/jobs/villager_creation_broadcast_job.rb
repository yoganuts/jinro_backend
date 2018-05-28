# frozen_string_literal: true

class VillagerCreationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(villager)
    ActionCable.server.broadcast(
      "villager_#{villager.village_id}",
      id: villager.id,
      name: villager.name,
      code: villager.code
    )
  end
end
