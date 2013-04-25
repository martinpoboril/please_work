class CommentsController < ApplicationController
  before_filter :signed_in_traveler, only: [:create, :destroy]
  before_filtre :correct_traveler,   only: :destroy

  def create
    @comment = current_traveler.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Comment was successfully created!"
      redirect_to root_url
    else
	  @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_url
  end

  private

    def correct_traveler
      @comment = current_traveler.comments.find_by_id(params[:id])
      redirect_to root_url if @comment.nil?
    end
end