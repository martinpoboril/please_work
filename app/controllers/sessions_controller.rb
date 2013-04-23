class SessionsController < ApplicationController
  def new
  end

  def create
    traveler = Traveler.find_by_email(params[:session][:email].downcase)
    if traveler && traveler.authenticate(params[:session][:password])
      sign_in traveler
	  redirect_to traveler
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
	sign_out
	redirect_to root_url
  end
end
