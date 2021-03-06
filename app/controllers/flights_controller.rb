class FlightsController < ApplicationController

  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  respond_to :html

  load_and_authorize_resource

  def index
    @q = Flight.search(params[:q])
    @flights = @q.result(distinct: true)
  end

  def show
    respond_with(@flight)
  end

  def map
    respond_with(@flight)
  end

  def myflights
    # respond_with(@flights)
    # @q = current_user.flights.search(params[:q])
    # @flights = @q.result(distinct: true)
    @flights = current_user.flights
  end

  def new
    @flight = Flight.new
    respond_with(@flight)
  end

  def edit
  end

  def create
    @flight = current_user.flights.new(flight_params)
    puts flight_params
    @flight.save
    respond_with(@flight)
  end

  def update    
    @flight.update(flight_params)
    respond_with(@flight)
  end

  def destroy
    @flight.destroy
    respond_with(@flight)
  end

  private
    def set_flight
      @flight = Flight.find(params[:id])
    end

    def flight_params
      params.require(:flight).permit(:video_link, :drone_id, :camera_id, :user_id, :lat, :lng, :formatted_address, :model_make, :flight_image, :remote_flight_image_url)
    end
end
