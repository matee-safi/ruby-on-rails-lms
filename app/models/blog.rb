class Blog < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_one_attached :title_image

  validates :author, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
end
