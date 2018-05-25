# frozen_string_literal: true

class VillagersController < ApplicationController
  before_action :set_villager, only: %i[show update destroy]

  # GET /villagers
  def index
    @villagers = Villager.where(village_id: params[:village_id])

    render json: @villagers
  end

  # GET /villagers/1
  def show
    render json: @villager
  end

  # POST /villagers
  def create
    @villager = Villager.new(villager_params)

    if @villager.save
      render json: @villager, status: :created, location: @villager
    else
      render json: @villager.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /villagers/1
  def update
    if @villager.update(villager_params)
      render json: @villager
    else
      render json: @villager.errors, status: :unprocessable_entity
    end
  end

  # DELETE /villagers/1
  def destroy
    @villager.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_villager
    @villager = Villager.where(village_id: params[:village_id]).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def villager_params
    params.require(:villager).permit(:name, :code, :village_id, :role_id)
  end
end
