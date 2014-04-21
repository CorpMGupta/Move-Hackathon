class TeamController < ApplicationController
  def list
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
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
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to :action => 'list'
  end

  private
  def team_params
    params.require(:team).permit(:name, :members, :description, :summary, :screenshot)
  end
end
