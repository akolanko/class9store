class Product < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true
	validates :price, presence: true, numericality: {only_integer: true}
	validates :inventory, presence: true, numericality: {only_integer: true}
	
	belongs_to :category
	has_many :order_products
	has_many :orders, through: :order_products


end
