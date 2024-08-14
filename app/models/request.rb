class Request < ApplicationRecord
  belongs_to :costume
  belongs_to :user
  ## had to disable this... not sure why
  # validates :status, default: nil
  validates :start_date, presence: true #js
  validates :end_date, presence: true #js

end
