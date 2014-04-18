class OrdersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @orders = @user.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @products = @order.products.all
  end

  def new
    @order = Order.new
    @user = User.find(params[:user_id])
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = params[:user_id]
    if @order.save
      flash[:notice] = "Thank you for your order."
      redirect_to "/"
    else
      flash[:alert] = "There was a problem submitting your order."
      redirect_to :back
    end
  end

  def edit
    @order = Order.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @order = Order.where(id: params[:id]).first
    if @order.update_attributes(order_params)
      flash[:notice] = "Your order was submitted sucessfully."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem submitting your order."
      redirect_to :back
    end
  end

  def destroy
  end

private
  def order_params
    params.require(:order).permit(:card_id)
  end

end
