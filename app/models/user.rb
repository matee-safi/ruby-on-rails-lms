class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture

  validates :name, presence: true
  validates :phone_number, format: { with: /\A\d{10}\z/, message: 'only allows 10 digits' }, allow_blank: true
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
