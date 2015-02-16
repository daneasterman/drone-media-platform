class FlightsController < ApplicationController

  before_action :authenticate_user!
  
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  respond_to :html

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

  def new
    @flight = Flight.new
    respond_with(@flight)
  end

  def edit
  end

  def create
    @flight           = current_user.flights.new(flight_params)
    # @flight.latitude  = params[:lat]
    # @flight.longitude = params[:lng]
    # @flight.location  = params[:formatted_address]
    @flight.save
    respond_with(@flight)
  end

  def update
    # @flight.latitude  = params[:lat]
    # @flight.longitude = params[:lng]
    # @flight.location  = params[:formatted_address]
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
      params.require(:flight).permit(:video_link, :drone_id, :user_id, :latitude, :longitude, :formatted_address)
    end
end
