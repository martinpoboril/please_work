class TravelersController < ApplicationController

  def show
    @traveler = Traveler.find(params[:id])
  end
  
  def new
    @traveler = Traveler.new
  end
  
  def create
    @traveler = Traveler.new(params[:traveler])
	if @traveler.save
	  sign_in @traveler
	  flash[:success] = "Welcome to the Traveler's family!"
	  redirect_to @traveler
	else
	  render 'new'
	end
  end
end
