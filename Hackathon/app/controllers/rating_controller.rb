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

    Team.all.each do |trec|
    Rating.all.each do |rec|
      if trec.id.eql?(rec.tid)
        if !rec.jid.nil?

          if !rec.cat1.nil?
            @cat1rating = @cat1rating + rec.cat1.to_i
            @cat1users = @cat1users + 1
          end

          if !rec.cat2.nil?
            @cat2rating = @cat2rating + rec.cat2.to_i
            @cat2users = @cat2users + 1
          end

          if !rec.cat3.nil?
            @cat3rating = @cat3rating + rec.cat3.to_i
            @cat3users = @cat3users + 1
          end

          if !rec.cat4.nil?
            @cat4rating = @cat4rating + rec.cat4.to_i
            @cat4users = @cat4users + 1
          end

          if !rec.cat5.nil?
            @cat5rating = @cat5rating + rec.cat5.to_i
            @cat5users = @cat5users + 1
          end

          if !rec.overall.nil?
            @overallrating = @overallrating + rec.overall.to_i
            @overallusers = @overallusers + 1
          end
        end
      end
      end
    end

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
