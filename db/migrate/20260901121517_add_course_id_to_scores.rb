class AddCourseIdToScores < ActiveRecord::Migration[7.2]
  def change
    add_reference :scores, :course, null: false, foreign_key: true
  end
end
