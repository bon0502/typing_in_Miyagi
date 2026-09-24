class Score < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def self.ranking_by_course
    Course.all.each_with_object({}) do |course, hash|
      hash[course] = where(course_id: course.id)
                      .joins(:user)
                      .select("scores.user_id, users.nickname, MAX(scores.score) as best_score")
                      .group("scores.user_id, users.nickname")
                      .order("best_score DESC")
                      .limit(3)
    end
  end
end
