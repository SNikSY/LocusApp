class Location < ApplicationRecord
     # Associations
     has_many :topics, dependent: :nullify
   
     # Validations
     validates :name, presence: true
   end
   