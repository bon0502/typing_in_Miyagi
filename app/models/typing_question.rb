class TypingQuestion < ApplicationRecord
  belongs_to :course
  has_many :typing_answers, dependent: :destroy

  accepts_nested_attributes_for :typing_answers,
                                allow_destroy: true,
                                reject_if: :all_blank

  validates :question_text, presence: true
end
