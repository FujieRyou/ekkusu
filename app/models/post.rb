class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
  validates :content, presence: true, length: {maximum: 255}
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
