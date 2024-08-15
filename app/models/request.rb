class Request < ApplicationRecord
  belongs_to :costume
  belongs_to :user
  ## had to disable this... not sure why
  # validates :status, default: nil
  validates :start_date, presence: true #js
  validates :end_date, presence: true #js

  enum :status, [:pending, :accepted, :declined, :completed]
  # enum :status, {pending: "pending", accepted: "accepted", declined: "declined"}
end
