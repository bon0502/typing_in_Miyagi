class Course < ApplicationRecord
  has_many :typing_questions, dependent: :destroy
end
