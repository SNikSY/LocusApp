class Category < ApplicationRecord
  # Associations
  has_many :topics, dependent: :nullify

  # Validations 
  validates :title, presence: true
end
