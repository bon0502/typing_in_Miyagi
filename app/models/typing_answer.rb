class TypingAnswer < ApplicationRecord
  belongs_to :typing_question

  validates :answer_text, presence: true
end
