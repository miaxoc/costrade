class Review < ApplicationRecord
  belongs_to :user
  belongs_to :request
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5, message: "should be between 0 to 5" }, presence: true

  validates :request, presence: true, uniqueness: { scope: :user_id }
  validates :user, presence: true, uniqueness: { scope: :request_id }
end
