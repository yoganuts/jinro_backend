# frozen_string_literal: true

class TalkChannel < ApplicationCable::Channel
  def subscribed
    stream_from "talk_#{params[:village]}"
  end

  def unsubscribed; end

  def create(options)
    Talk.create(
      villager: Villager.find_by(code: options.fetch('villagerCode')),
      content: options.fetch('content')
    )
  end
end
