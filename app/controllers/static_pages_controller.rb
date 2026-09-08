class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: [ :top ]

  def top
    @scores_by_course = Score.ranking_by_course
  end
end
