class Order < ActiveRecord::Base

	belongs_to :user
	belongs_to :card
	has_many :order_products
	has_many :products, through: :order_products

	validates :user_id, presence: true, numericality: {only_integer: true}

end
