class ScoresController < ApplicationController
  def index
    @scores_by_course = Score.ranking_by_course
  end

  def create
    score = current_user.scores.new(score_params)

    if score.save
      render json: { status: "success", score: score }, status: :created
    else
      render json: { status: "error", errors: score.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def score_params
    params.require(:score).permit(:score, :course_id)
  end
end
