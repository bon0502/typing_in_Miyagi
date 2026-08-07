class TypingQuestionsController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @questions = @course.typing_questions
  end

  def check_answer
    question = TypingQuestion.find(params[:id])
    user_answer = params[:user_input].strip.downcase

    correct_answers = question.answer.split(",").map(&:strip).map(&:downcase)

    if correct_answers.include?(user_input)
        render json: { result: "correct", message: "正解です！" }
    else
        render json: { result: "incorrect", message: "不正解です。もう一度挑戦してください。" }
    end
end
end
