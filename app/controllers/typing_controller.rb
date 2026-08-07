class TypingController < ApplicationController
  def show
    # パラメータから course_id を取得
    @course = Course.find(params[:course_id])

    # コース名を取得
    @course_name = @course.name

    # コースに紐づく問題を取得
    @typing_questions = @course.typing_questions

    # 問題が存在しない場合の対応
    if @typing_questions.empty?
      @question = "問題が見つかりません"
    end
  end

  def check_answer
    question = TypingQuestion.find(params[:id])
    user_input = params[:user_input].strip.downcase

    correct_answers = question.answer.split(",").map(&:strip).map(&:downcase)

    if correct_answers.include?(user_input)
      render json: { result: "correct", message: "正解です！" }
    else
      render json: { result: "incorrect", message: "不正解です。もう一度挑戦してください。" }
    end
  end
end
