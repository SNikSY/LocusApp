class User < ApplicationRecord
    has_many :topics, foreign_key: :creator_user_id, dependent: :destroy
    has_many :comments, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 'user', admin: 'admin' }
  before_validation :set_default_role, on: :create
  private

  def set_default_role
    self.role ||= admin? ? 'admin' : 'user'
  end
end
