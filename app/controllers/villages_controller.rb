# frozen_string_literal: true

class VillagesController < ApplicationController
  before_action :set_village, only: %i[show update destroy]

  # GET /villages
  def index
    @villages = Village.all

    render json: @villages
  end

  # GET /villages/1
  def show
    render json: @village
  end

  # POST /villages
  def create
    @village = Village.new(village_params)

    if @village.save
      render json: @village, status: :created, location: @village
    else
      render json: @village.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /villages/1
  def update
    if @village.update(village_params)
      render json: @village
    else
      render json: @village.errors, status: :unprocessable_entity
    end
  end

  # DELETE /villages/1
  def destroy
    @village.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_village
    @village = Village.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def village_params
    params.require(:village).permit(:name, :code, :status)
  end
end
