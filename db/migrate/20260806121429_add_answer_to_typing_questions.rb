class AddAnswerToTypingQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :typing_questions, :answer, :string
  end
end
