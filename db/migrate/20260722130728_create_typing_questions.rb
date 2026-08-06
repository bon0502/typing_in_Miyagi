class CreateTypingQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :typing_questions do |t|
      t.references :course, null: false, foreign_key: true
      t.string :question_text

      t.timestamps
    end
  end
end
