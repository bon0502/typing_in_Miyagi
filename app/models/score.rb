class Score < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def self.ranking_by_course
    Course.all.each_with_object({}) do |course, hash|
      hash[course] = where(course_id: course.id).includes(:user).order(score: :desc).limit(3)
    end
  end
end
