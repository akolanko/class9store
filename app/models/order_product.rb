class OrderProduct < ActiveRecord::Base

	belongs_to :order
	belongs_to :product

	validates :order_id, presence: true, numericality: {only_integer: true}
	validates :product_id, presence: true, numericality: {only_integer: true}
	validates :quantity, presence: true, numericality: {only_integer: true}

end
