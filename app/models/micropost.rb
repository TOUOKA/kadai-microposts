class Micropost < ApplicationRecord
  belongs_to :user
  
  #追記
  has_many :favorites ,foreign_key: 'micropost_id', dependent: :destroy
  has_many :users, through: :favorites
  
  # マイクロポストをいいねする
  #def likes(user)
   # likes.create(user_id: user.id)
  #end
  
  # マイクロポストのいいねを解除する
  #def unlikes(user)
  #  likes.find_by(user_id: user.id).destory
  #end
  
  validates :content, presence: true, length: { maximum: 255}
end
