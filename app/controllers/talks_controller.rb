# frozen_string_literal: true

class TalksController < ApplicationController
  before_action :set_talk, only: %i[show update destroy]

  # GET /talks
  def index
    @talks = Talk.search(params[:q])
                 .result
                 .where(village_id: params[:village_id])
                 .order(created_at: :desc)
                 .page(params[:page]).per(20)

    render json: @talks.to_json(include: [:villager])
  end

  # GET /talks/1
  def show
    render json: @talk
  end

  # POST /talks
  def create
    @talk = Talk.new(talk_params)

    if @talk.save
      render json: @talk, status: :created, location: @talk
    else
      render json: @talk.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /talks/1
  def update
    if @talk.update(talk_params)
      render json: @talk
    else
      render json: @talk.errors, status: :unprocessable_entity
    end
  end

  # DELETE /talks/1
  def destroy
    @talk.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_talk
    @talk = Talk.where(village_id: params[:village_id]).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def talk_params
    params.require(:talk).permit(:villager_id, :content, :stamp_no)
  end
end
