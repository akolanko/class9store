class OrderProductsController < ApplicationController
  def new
  	@orderproduct = OrderProduct.new
	@user = User.find(params[:user_id])
	@product = Product.find(params[:product_id])
  end

  def create
  	@orderproduct = OrderProduct.new(orderproduct_params)
	@user = User.find(params[:user_id])
	@orderproduct.product_id = params[:product_id]
	@order = Order.create(user_id: params[:user_id])
	@orderproduct.order_id = @order.id
	if @orderproduct.save
		flash[:notice] = "Product added to order successfully."
		redirect_to edit_user_order_path(@user.id, @order.id)
	else
		flash[:alert] = "There was a problem adding this product to your order."
		redirect_to :back
	end
  end

  def show
  	@orderproduct = OrderProduct.find(params[:id])
	@user = User.find(params[:user_id])
	@product = Product.find(params[:product_id])
	@order = Order.where(id: @orderproduct.order_id)
  end

private

	def orderproduct_params
		params.require(:order_product).permit(:quantity)
	end

end
