class RemoveCourseFromScores < ActiveRecord::Migration[7.2]
  def change
    remove_column :scores, :course, :string
  end
end
