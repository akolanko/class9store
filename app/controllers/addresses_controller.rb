class AddressesController < ApplicationController
  
  def new
  	@address = Address.new
  	@card = Card.find(params[:card_id])
  	@user = User.find(params[:user_id])
  end

  def create
  	@user = User.find(params[:user_id])
  	@card = Card.find(params[:card_id])
  	@address = Address.new(address_params)
  	@address.card_id = @card.id
  	if @address.save
  		flash[:notice] = "Billing address saved successfully."
  		redirect_to user_cards_path(@user.id)
  	else
  		flash[:alert] = "There were some problems saving your billing address."
  		render "new"
  	end
  end

private
	def address_params
		params.require(:address).permit(:fname, :lname, :street, :city, :state, :zip, :country)
	end

end
