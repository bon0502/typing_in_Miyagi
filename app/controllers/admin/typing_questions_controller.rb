class Admin::TypingQuestionsController < ApplicationController
  before_action :set_course
  before_action :set_typing_question, only: [:edit, :update, :destroy]

  def index
    @typing_questions = @course.typing_questions.includes(:typing_answers)
  end

  def new
    @typing_question = @course.typing_questions.build
    @typing_question.typing_answers.build
  end

  def create
    @typing_question = @course.typing_questions.build(typing_question_params)
    if @typing_question.save
      redirect_to new_admin_course_typing_question_typing_answer_path(@course, @typing_question), notice: '質問を作成しました。答えを追加してください。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @typing_question.typing_answers.build if @typing_question.typing_answers.empty?
  end

  def update
    if @typing_question.update(typing_question_params)
      redirect_to admin_course_path(@course), notice: '問題が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @typing_question.destroy
    redirect_to admin_course_path(@course), notice: '問題が削除されました。'
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_typing_question
    @typing_question = @course.typing_questions.find(params[:id])
  end

  def typing_question_params
    params.require(:typing_question).permit(
      :question_text, :meaning,
      typing_answers_attributes: [:id, :answer_text, :is_primary, :_destroy]
    )
  end
end
