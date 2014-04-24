class RatingController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @rating.save
    redirect_to :controller => 'team', :action => 'show'
  end

  def new
  end

  def list
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def rating_params
    params.require(:team_rating).permit(:tid, :overall, :cat1, :cat2, :cat3, :cat4, :cat5, :jid, :comment)
  end

end
