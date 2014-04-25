class RatingController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    if(@rating.save)
      flash[:message] = 'Rating successfully saved.'
    else
      flash[:message] = 'Rating not saved.'
    end
    session[:user_show] = true
    redirect_to :controller => 'team', :action => 'show'
  end

  def new
  end

  def list
    @ratings = Rating.all
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
    if(params[:id].nil?)
      redirect_to home_homepage_url
    else
      @rating = Rating.find(params[:id])
      @rating.destroy
      redirect_to :action => 'list'
    end
  end

  private
  def rating_params
    params.require(:team_rating).permit(:tid, :overall, :cat1, :cat2, :cat3, :cat4, :cat5, :jid, :comment)
  end

end
