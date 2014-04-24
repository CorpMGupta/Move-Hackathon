class TeamController < ApplicationController
  def list
    @teams = Team.all
  end

  def show

    if(params[:id].nil?)
      redirect_to home_homepage_url
    else
      @teams = Team.all
      @team = Team.find(params[:id])
      @ratings = Rating.all
      @current_team_rating = Rating.find_by_tid(params[:id])
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
    params.require(:team).permit(:name, :members, :description, :summary, :screenshot)
  end
end
