class CreateTypingAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :typing_answers do |t|
      t.references :typing_question, null: false, foreign_key: true
      t.string :answer_text, null: false
      t.boolean :is_primary, default: true

      t.timestamps
    end
  end
end
