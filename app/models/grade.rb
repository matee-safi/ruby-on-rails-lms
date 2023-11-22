class Grade < ApplicationRecord
  belongs_to :user
  belongs_to :academic_class
end
