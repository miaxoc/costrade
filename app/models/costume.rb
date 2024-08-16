class Costume < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :reviews, through: :requests

  validates :title, presence: true
  validates :description, presence: true
  SIZE = ['S', 'M', 'L']
  validates :size, presence: true, inclusion: { in: SIZE }
  validates :price, presence: true
  CATEGORIES = ['Anime', 'Animal', 'Scary', 'Professions']
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_many_attached :photos
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
