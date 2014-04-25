class CategoryController < ApplicationController
  def create
    @category = Category.new(category_params)

    if(Category.all.length.eql?(5))
      flash[:message] = 'Categories cannot exceed 5.'
      redirect_to :action => 'list'
    else
        if @category.save
          redirect_to :action => 'list'
        else
          redirect_to :action => 'new'
        end
    end

  end

  def new
  end

  def list
    @categories = Category.all
  end

  def update
    if(params[:id].nil?)
      redirect_to home_homepage_url
    else
      @category = Category.find(params[:id])
      if @category.update_attributes( :name => params[:updatedname])
        redirect_to :action => 'list'
      else
        redirect_to :action => 'edit'
      end
    end
  end

  def edit
    if(params[:id].nil?)
      redirect_to home_homepage_url
    else
      @category = Category.find(params[:id])
    end
  end

  def destroy
    if(params[:id].nil?)
      redirect_to home_homepage_url
    else
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to :action => 'list'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
