class ProductsController < ApplicationController

  def all
  	@products = Product.all
  end

  def index
  	@category = Category.find(params[:category_id])
  	@products = @category.products.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  	@category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
  	@product = Product.new(product_params)
  	@product.category_id = params[:category_id]
  	if @product.save
  		flash[:notice] = "#{@product.name} created successfully."
  		redirect_to category_products_path(@product.category.id)
  	else
  		flash[:alert] = "There were some problems saving your product."
  		render "new"
  	end
  end

  def destroy
  	@product = Product.where(id: params[:id]).first
  	if @product && @product.destroy
  		flash[:notice] = "Your product was deleted sucessfully."
  		redirect_to products_path
  	else
  		flash[:alert] = "There was a problem deleting your product."
  		redirect_to :back
  	end
  end

private
	def product_params
		params.require(:product).permit(:name, :price, :inventory)
	end

end
