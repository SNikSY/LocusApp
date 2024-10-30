class Topic < ApplicationRecord
     belongs_to :user, foreign_key: :creator_user_id
     belongs_to :category, optional: true
     belongs_to :location, optional: true
     
     has_one_attached :images  
     has_many :comments, dependent: :destroy

     validates :title, presence: true
     validates :description, presence: true
   end
   