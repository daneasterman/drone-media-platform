class DronesController < ApplicationController
  before_action :set_drone, only: [:show]

  def index
    @drones = Drone.all
  end

  def show
    respond_with(@drone)
  end

  private
    def set_drone
      @drone = Drone.find(params[:id])
    end

    def playlist_params
      params.require(:drone).permit(:model, :make)
    end


end
