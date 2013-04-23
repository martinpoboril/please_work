module SessionsHelper

  def sign_in(traveler)
    cookies.permanent[:remember_token] = traveler.remember_token
    self.current_traveler = traveler
  end
  
  def signed_in?
	!current_traveler.nil?
  end
  
  def current_traveler=(traveler)
    @current_traveler = traveler
  end
  
  def current_traveler
    @current_traveler ||= Traveler.find_by_remember_token(cookies[:remember_token])
  end
  
  def sign_out
	self.current_traveler = nil
	cookies.delete(:remember_token)
  end
end