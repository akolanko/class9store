class Address < ActiveRecord::Base

	validates :fname, presence: true
	validates :lname, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, numericality: {only_integer: true}
	validates :country, presence: true

	has_one :card

end
