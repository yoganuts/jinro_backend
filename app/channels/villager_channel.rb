# frozen_string_literal: true

class VillagerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "villager_#{params[:village_id]}"
  end

  def unsubscribed; end
end
