class TypingController < ApplicationController
  def show
    # パラメータから course_id を取得
    course_id = params[:course_id]

    # course_id に応じて問題文を変える（仮実装）
    courses = {
      "1" => { "name" => "🗣 方言コース", "question" => "宮城の方言で「おはよう」は？" },
      "2" => { "name" => "🍡 名物コース", "question" => "仙台の有名な食べ物は何ですか？" },
      "3" => { "name" => "🌸 まるごとコース", "question" => "宮城県の名産品は何ですか？" }
    }

    # コース情報を取得（存在しない場合はデフォルト値）
    course = courses[course_id] || { name: "タイピング練習", question: "問題が見つかりません" }

    @course_name = course["name"]
    @question = course["question"]
    @course_id = course_id
  end
end
