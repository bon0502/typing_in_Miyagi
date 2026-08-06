class Admin::TypingAnswersController < ApplicationController
  before_action :set_course
  before_action :set_typing_question

  def new
    @typing_answer = @typing_question.typing_answers.build
  end

  def create
    @typing_answer = @typing_question.typing_answers.build(typing_answer_params)
    if @typing_answer.save
      redirect_to admin_course_path(@course), notice: "答えを作成しました"
    else
      render :new
    end
  end

  def destroy
    @typing_answer = @typing_question.typing_answers.find(params[:id])
    @typing_answer.destroy
    redirect_to admin_course_typing_questions_path(@typing_question.course), notice: "答えを削除しました"
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_typing_question
    @typing_question = @course.typing_questions.find(params[:typing_question_id])
  end

  def typing_answer_params
    params.require(:typing_answer).permit(:answer_text)
  end
end
