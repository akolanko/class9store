class CardsController < ApplicationController
  def index
  	@user = User.find(params[:user_id])
  	@cards = @user.cards.all
  end

  def new
  	@card = Card.new
  	@user = User.find(params[:user_id])
  end

  def create
  	@user = User.find(params[:user_id])
  	@card = Card.new(card_params)
  	@card.user_id = params[:user_id]
  	if @card.save
		  flash[:notice] = "You card was saved successfully."
  		redirect_to user_cards_path(@card.user.id)
  	else
  		flash[:alert] = "There were some problems saving your card."
  		render "new"
  	end
  end

  def destroy
  	@card = Card.where(id: params[:id]).first
  	if @card && @card.destroy
  		flash[:notice] = "Your card was deleted sucessfully."
  		redirect_to user_cards_path(@card.user.id)
  	else
  		flash[:alert] = "There was a problem deleting your card."
  		redirect_to :back
  	end
  end

  private
	def card_params
		params.require(:card).permit(:name, :number, :expiration, :security)
	end

end
