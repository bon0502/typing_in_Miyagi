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
end
