class User < ApplicationRecord
  has_many :themes

  validates :provider, presence: true, length: { maximum: 255 }
  validates :uid, presence: true, length: { maximum: 255 }
  validates :nickname, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :image, presence: true, length: { maximum: 255 }
end
