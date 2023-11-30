class Course < ApplicationRecord
  validates :name, presence: true
end
