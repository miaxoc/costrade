class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :username, presence: true
  validates :password, presence: true

  has_one_attached :photo

  has_many :costumes
  has_many :requests
  has_many :requests_as_owner, through: :costumes, class_name: "Request", source: :requests

  # validates :description
  # validates :location
  # validates :profile_picture
  # validates :first_name
  # validates :last_name

end
