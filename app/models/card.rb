class Card < ActiveRecord::Base

	belongs_to :user
	has_many :orders
	has_one :address

end
