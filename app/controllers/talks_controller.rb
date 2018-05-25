class TalksController < ApplicationController
  before_action :set_talk, only: [:show, :update, :destroy]

  # GET /talks
  def index
    @talks = Talk.all

    render json: @talks
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
      @talk = Talk.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def talk_params
      params.require(:talk).permit(:villager_id, :content)
    end
end
