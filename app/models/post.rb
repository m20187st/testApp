class Post < ApplicationRecord
  belongs_to :user
  has_many :favotite_users, through: :favorites, source: :user
end
