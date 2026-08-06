class AddMeaningToTypingQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :typing_questions, :meaning, :text
  end
end
