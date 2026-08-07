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
  { question_text: "いずい", answer: "izui", meaning: "「しっくりこない」「違和感がある」" },
  { question_text: "たごまる", answer: "tagomsru", meaning: "服や紐などがしわくちゃに縮むなど" },
  { question_text: "うるかす", answer: "urukasu", meaning: "「水に浸しておく」「水につけてふかふかにふやかす」など" },
  { question_text: "おしょすい", answer: "osyosui", meaning: "恥ずかしい" },
  { question_text: "がおる", answer: "gaoru", meaning: "疲れた" },
  { question_text: "おばんです", answer: "obanndesu", meaning: "こんばんは(夕方から夜にかけて)" },
  { question_text: "がおった", answer: "gaotta","gaoxtuta", meaning: "疲れた" },
  { question_text: "いぎなり", answer: "iginari", meaning: "「とても」「すごく」「非常に」" },
  { question_text: "おだつなよ", answer: "odatunayo", meaning: "「ふざけるな」「いい気になるな」「調子に乗るな」など " },
  { question_text: "食ってけさいん", answer: "kuttekesainn", "kuxtukesainn", meaning: "「食べてください」「食べていってください」" },
  { question_text: "ごっしゃぐ", answer: "gossyagu", "goxtusyagu", "gossixyagu", meaning: "「怒る」「叱る」など " },
  { question_text: "しずね", answer: "sizune", meaning: "「うるさい」「騒がしい」など " },
  { question_text: "ひゃっこい", answer: "hyakkoi", "hixyakkoi", "hyaxtukoi", meaning: "「冷たい」" },
  { question_text: "いがす", answer: "igasu", meaning: "「いいよ」「了解」など。地域によって「いらない（不要）」という意味も" },
  { question_text: "やんだ", answer: "yannda", meaning: "「嫌だ」" }
])

# 名物地名コースの問題
meibutsu.typing_questions.create!([
  { question_text: "ずんだ", answer: "zunnda" },
  { question_text: "牛タン", answer: "gyuutann" },
  { question_text: "仙台", answer: "senndai" }
])

# 方言会話コースの問題
marugoto.typing_questions.create!([
  { question_text: "おはよう靴下だね", answer: "ohayoukutusitadane",  meaning: "靴下穴あいてるね" },
  { question_text: "おめえこばがくせえな", answer: "omeekobagakuseena", meaning: "「お前は馬鹿みたいだ」" },
  { question_text: "しじゃかぶがいてえ", answer: "sijakabugaitee", meaning: "膝が痛い" }
])

puts "シードデータの作成が完了しました！"
puts "コース数: #{Course.count}"
puts "問題数: #{TypingQuestion.count}"
