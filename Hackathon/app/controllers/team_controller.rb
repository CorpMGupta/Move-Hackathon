class TeamController < ApplicationController
  def list
    @teams = Team.all
  end

  def show

    if(params[:id].nil? && !session[:user_show])
      redirect_to home_homepage_url
    else
      @teams = Team.all

      if(params[:id].nil?)
        @id = Team.first.id
        @team = Team.find(@id)
        @current_team_rating = Rating.find_by_tid(@id)
      else
        @team = Team.find(params[:id])
        @current_team_rating = Rating.find_by_tid(params[:id])
      end

      @ratings = Rating.all


      @show_judge_report = false
      @show_crowd_report = false

      Rating.all.each do |f|
        if f.tid.eql?(@team.id) && !f.jid.nil?
          @show_judge_report = true
        end

        if(f.tid.eql?(@team.id) && f.jid.nil?)
          @show_crowd_report = true
        end
      end

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

      Rating.all.each do |rec|
        if rec.tid.eql?(@team.id)
          if rec.jid.nil?

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

  def edit
    if(params[:id].nil?)
      redirect_to home_homepage_url
    else
      @team = Team.find(params[:id])
    end
  end

  def update
    if(params[:id].nil?)
      redirect_to home_homepage_url
    else
    @team = Team.find(params[:id])
      if @team.update_attributes( :name => params[:updatedname],
                                  :members => params[:updatedmembers],
                                  :description => params[:updateddesc],
                                  :summary => params[:updatedsummary],
                                  :screenshot => params[:updatedscreenshot])
        redirect_to :action => 'show', :id => @team
      else
        render :action => 'edit'
      end
    end
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def new
  end

  def destroy
    if(params[:id].nil?)
      redirect_to home_homepage_url
    else
      @team = Team.find(params[:id])
      @team.destroy
      redirect_to :action => 'list'
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :members, :description, :summary)
  end
end
