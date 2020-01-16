class Address < ApplicationRecord
	belongs_to :user
         # validates_associated :addresses
         validates :name, presence:true
         # validates :user_id, numericality: true, length: { maximum: 3, minimum: 2}, uniqueness: true
         validates :street, presence: true
         validates :city, presence: true
         validates :state, presence: true
         validates :country, presence: true

end