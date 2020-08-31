class Theme < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 45 }
  validates :theme1, presence: true, length: { maximum: 20 }
  validates :theme2, presence: true, length: { maximum: 20 }
  validates :vote1, presence: true
  validates :vote2, presence: true
  validates :sum, presence: true
  validates :difference, presence: true
end
