class RatingController < ApplicationController

  helper_method :sort_column, :sort_direction

  def create
    @rating = Rating.new(rating_params)

    @judge_id = session[:user_id]
    @team_id = session[:team_id]

    chkInsert = false
    session[:insert] = false
    session[:modify] = false

    if(@judge_id.nil?)
      if(@rating.save)
        session[:insert] = true
      end
    else

      Rating.all.each do |f|
        if f.jid.eql?(@judge_id) && f.tid.eql?(@team_id)

          if params[:team_rating][:comment].blank?
            params[:team_rating][:comment] = f.comment
          end

          if params[:team_rating][:cat1].blank?
            params[:team_rating][:cat1] = f.cat1
          end

          if params[:team_rating][:cat2].blank?
            params[:team_rating][:cat2] = f.cat2
          end

          if params[:team_rating][:cat3].blank?
            params[:team_rating][:cat3] = f.cat3
          end

          if params[:team_rating][:cat4].blank?
            params[:team_rating][:cat4] = f.cat4
          end

          if params[:team_rating][:cat5].blank?
            params[:team_rating][:cat5] = f.cat5
          end

          if params[:team_rating][:overall].blank?
            params[:team_rating][:overall] = f.overall
          end

          if f.update(rating_params)
            session[:modify] = true
            chkInsert = true
          end
        end
      end

      if !chkInsert
        if(@rating.save)
          session[:insert] = true
        end
      end

    end

    session[:user_show] = true
    redirect_to :controller => 'team', :action => 'show'
  end

  def new
  end

  def list
    @ratings = Rating.all
  end

  def report

    @ratings = Rating.all
    @teams = Team.all
    @sortedteams = Team.order(sort_column + " " + sort_direction)

    @cat1rating = 0
    @cat1users = 0

    @cat2rating = 0
    @cat2users = 0

    @cat3rating = 0
    @cat3users = 0

    @cat4rating = 0
    @cat4users = 0

    @cat5rating = 0
    @cat5users = 0

    @overallrating = 0
    @overallusers = 0

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

  def sort_column
    Team.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
