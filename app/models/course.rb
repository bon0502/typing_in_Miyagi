class Course < ApplicationRecord
  has_many :typing_questions, dependent: :destroy
  has_many :scores, dependent: :destroy
end
