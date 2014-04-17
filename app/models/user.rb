class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create

	validates :email, presence: true, confirmation: true, uniqueness: true
	validates :fname, presence: true
	
	has_many :orders
	has_many :cards
	
end
