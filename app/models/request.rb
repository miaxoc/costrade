class Request < ApplicationRecord
  belongs_to :costume
  belongs_to :user
  has_many :reviews
  ## had to disable this... not sure why
  # validates :status, default: nil
  validates :start_date, presence: true #js
  validates :end_date, presence: true #js

  enum :status, [:pending, :accepted, :declined]
  # enum :status, {pending: "pending", accepted: "accepted", declined: "declined"}
end
