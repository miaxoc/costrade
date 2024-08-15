class Costume < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :reviews, through: :requests

  validates :title, presence: true, length: { maximum: 18 }
  validates :description, presence: true
  SIZE = ['S', 'M', 'L']
  validates :size, presence: true, inclusion: { in: SIZE }
  validates :price, presence: true
  CATEGORIES = ['Anime', 'Animal', 'Scary', 'Professions']
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_many_attached :photos
end
