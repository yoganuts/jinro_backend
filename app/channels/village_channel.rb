# frozen_string_literal: true

class VillageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'village'
  end

  def unsubscribed; end
end
