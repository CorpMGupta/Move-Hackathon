class CategoryController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def new
  end

  def list
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes( :name => params[:updatedname])
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to :action => 'list'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
