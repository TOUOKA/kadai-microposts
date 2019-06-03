class Micropost < ApplicationRecord
  belongs_to :user
  
  #追記
  has_many :favorites ,foreign_key: 'micropost_id', dependent: :destroy
  has_many :users, through: :favorites
  
  validates :content, presence: true, length: { maximum: 255}
end
