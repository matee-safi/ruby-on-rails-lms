class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :profile_picture, ProfilePictureUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :bio, length: { maximum: 500 }
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
