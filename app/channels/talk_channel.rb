# frozen_string_literal: true

class TalkChannel < ApplicationCable::Channel
  def subscribed
    stream_from "talk_#{params[:village_id]}"
  end

  def unsubscribed; end

  def create(options)
    Talk.create(
      villager: Villager.find_by(code: options.fetch('villager_code')),
      village_id: options.fetch('village_id'),
      content: options.fetch('content')
    )
  end
end
