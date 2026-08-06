# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

TypingQuestion.destroy_all
Course.destroy_all

hougen = Course.create!(name: "🗣 方言コース")
meibutsu = Course.create!(name: "🍡 名物地名コース")
marugoto = Course.create!(name: "🌸 方言会話コース")

# 方言コースの問題
hougen.typing_questions.create!([
  { question_text: "いずい" },
  { question_text: "たごまる" },
  { question_text: "うるかす" },
  { question_text: "おしょすい" },
  { question_text: "がおる" },
  { question_text: "おばんです" },
  { question_text: "がおった" },
  { question_text: "いぎなり" },
  { question_text: "おだつなよ" },
  { question_text: "食ってけさいん" },
  { question_text: "ごっしゃぐ" },
  { question_text: "しずね" },
  { question_text: "しずねっこ" },
  { question_text: "ひゃっこい" },
  { question_text: "いがす" },
  { question_text: "やんだ" }
])

# 名物コースの問題
meibutsu.typing_questions.create!([
  { question_text: "ずんだ" },
  { question_text: "牛タン" }
])

# まるごとコースの問題
marugoto.typing_questions.create!([
  { question_text: "仙台七夕" },
  { question_text: "光のページェント" },
  { question_text: "青葉城" }
])

puts "シードデータの作成が完了しました！"
puts "コース数: #{Course.count}"
puts "問題数: #{TypingQuestion.count}"
