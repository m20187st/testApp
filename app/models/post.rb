class Post < ApplicationRecord
  belongs_to :user

#  has_many :favotite_users, through: :favorites, source: :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  def favorited_by?(user)
	favorites.exists?(user_id: user.id)
  end
end
