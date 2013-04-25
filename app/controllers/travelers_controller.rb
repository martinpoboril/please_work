class TravelersController < ApplicationController
  before_filter :signed_in_traveler, only: [:index, :edit, :update, :destroy]
  before_filter :correct_traveler,   only: [:edit, :update]
  before_filter :admin_user,         only: :destroy

  def show
    @traveler = Traveler.find(params[:id])
	@comments = @traveler.comments.paginate(page: params[:page])
  end
  
  def destroy
    Traveler.find(params[:id]).destroy
    flash[:success] = "Traveler destroyed."
    redirect_to travelers_url
  end
  
  def new
    @traveler = Traveler.new
  end
  
  def index
    @travelers = Traveler.paginate(page: params[:page])
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
  
  def edit
  end
  
  def update
	if @traveler.update_attributes(params[:traveler])
	  flash[:success] = "Profile was successfully updated"
	  sign_in @traveler
	  redirect_to @traveler
	else
		render 'edit'
	end
  end
  
  private
	
	def signed_in_traveler
	  unless signed_in?
	    store_location
	    redirect_to signin_url, notice: "Please sign in."
	  end
	end
	
	def correct_traveler
	  @traveler = Traveler.find(params[:id])
	  redirect_to(root_path) unless current_traveler?(@traveler)
	end
	
	def admin_user
      redirect_to(root_path) unless current_traveler.admin?
    end
end
