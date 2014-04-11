class EmployeeController < ApplicationController
  def list
    @employees = ECatalogue.all
  end

  def show
    @employee = ECatalogue.find(params[:id])
  end

  def new
  end

  def create
    @employee = ECatalogue.new(employee_params)
    if @employee.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @employee = ECatalogue.find(params[:id])
  end

  def update
    @employee = ECatalogue.find(params[:id])
    if @employee.update_attributes(:name => params[:updatedname], :address => params[:updatedaddress], :phone => params[:updatedphone])
      redirect_to :action => 'show', :id => @employee
    else
      render :action => 'edit'
    end
  end

  def destroy
    @employee = ECatalogue.find(params[:id])
    @employee.destroy
    redirect_to :action => 'list'
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :address, :phone)
  end

end
