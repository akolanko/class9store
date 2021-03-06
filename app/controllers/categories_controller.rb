class CategoriesController < ApplicationController
  
  def index
  	@categories = Category.all
  	@category = Category.new
  end

  def show
  	@category = Category.find(params[:id])
  	@products = @category.products.all
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		flash[:notice] = "#{@category.name} category created successfully."
  		redirect_to categories_path
  	else
  		flash[:alert] = "There was a problem saving your category."
  		redirect_to :back
  	end
  end

  def destroy
  	@category = Category.where(id: params[:id]).first
  	if @category && @category.destroy
  		flash[:notice] = "#{@category.name} deleted successfully."
  		redirect_to categories_path
  	else
  		flash[:alert] = "There was a problem deleting your category."
  		redirect_to :back
  	end
  end

 private
 	def category_params
 		params.require(:category).permit(:name)
 	end

end
