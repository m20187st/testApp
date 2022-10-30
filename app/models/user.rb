class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :posts, through: :favorites
  has_many :favotite_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy

end
