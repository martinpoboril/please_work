class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @comment  = current_traveler.comments.build
      @feed_items = current_traveler.comments.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
