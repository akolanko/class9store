class Card < ActiveRecord::Base

	validates :name, presence: true, inclusion: {in: ["Master", "Visa", "Discover"]}
	validates :number, presence: true, numericality: {only_integer: true}, length: {minimum: 16, maximum: 16}
	validates :expiration, presence: true
	validates :security, presence: true, numericality: {only_integer: true}, length: {minimum: 3, maximum: 3}

	belongs_to :user
	has_many :orders
	has_one :address

end
