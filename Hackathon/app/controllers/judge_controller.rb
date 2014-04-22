class JudgeController < ApplicationController

  def list
    @judges = Judge.all
  end

  def edit
    @judge = Judge.find(params[:id])
  end

  def show
    @judge = Judge.find(params[:id])
  end

  def create
    @judge = Judge.new(judge_params)
    @judge.password = @judge.password.to_sha1()
    if @judge.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def new
  end

  def destroy
    @judge = Judge.find(params[:id])
    @judge.destroy
    redirect_to :action => 'list'
  end

  def update
    @judge = Judge.find(params[:id])

    @currentPass = @judge.password

    if params[:updatedpassword].blank?
      params[:updatedpassword] = @currentPass
    else
      @currentPass = params[:updatedpassword]
      params[:updatedpassword] = @currentPass.to_sha1()
    end

    if @judge.update_attributes( :name => params[:updatedname],
                                 :password => params[:updatedpassword])
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  private
  def judge_params
    params.require(:judge).permit(:name, :password)
  end
end
