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
hougen_questions = [
  { question_text: "いずい", meaning: "「しっくりこない」「違和感がある」", answers: [ "izui" ] },
  { question_text: "たごまる", meaning: "服や紐などがしわくちゃに縮むなど", answers: [ "tagomaru" ] },
  { question_text: "うるかす", meaning: "「水に浸しておく」「水につけてふかふかにふやかす」など", answers: [ "urukasu" ] },
  { question_text: "おしょすい", meaning: "恥ずかしい", answers: [ "osyosui", "oshosui" ] },
  { question_text: "がおる", meaning: "疲れた", answers: [ "gaoru" ] },
  { question_text: "おばんです", meaning: "こんばんは(夕方から夜にかけて)", answers: [ "obanndesu", "obandesu" ] },
  { question_text: "がおった", meaning: "疲れた", answers: [ "gaotta", "gaoxtuta" ] },
  { question_text: "いぎなり", meaning: "「とても」「すごく」「非常に」", answers: [ "iginari" ] },
  { question_text: "おだつなよ", meaning: "「ふざけるな」「いい気になるな」「調子に乗るな」など", answers: [ "odatunayo" ] },
  { question_text: "食ってけさいん", meaning: "「食べてください」「食べていってください」", answers: [ "kuttekesainn", "kuxtukesainn" ] },
  { question_text: "ごっしゃぐ", meaning: "「怒る」「叱る」など", answers: [ "gossyagu", "goxtusyagu", "gossixyagu" ] },
  { question_text: "しずね", meaning: "「うるさい」「騒がしい」など", answers: [ "sizune" ] },
  { question_text: "ひゃっこい", meaning: "「冷たい」", answers: [ "hyakkoi", "hixyakkoi", "hyaxtukoi" ] },
  { question_text: "いがす", meaning: "「いいよ」「了解」など。地域によって「いらない(不要)」という意味も", answers: [ "igasu" ] },
  { question_text: "やんだ", meaning: "「嫌だ」", answers: [ "yannda", "yanda" ] }
]

hougen_questions.each do |q_data|
  question = hougen.typing_questions.create!(
    question_text: q_data[:question_text],
    meaning: q_data[:meaning]
  )

  # 複数の答えを登録
  q_data[:answers].each do |answer|
    question.typing_answers.create!(answer_text: answer)
  end
end

# 名物地名コースの問題
meibutsu_questions = [
  { question_text: "ずんだ", meaning: "枝豆をすりつぶして作る餡", answers: [ "zunnda", "zunda" ] },
  { question_text: "牛タン", meaning: "仙台名物の焼肉", answers: [ "gyuutann", "gyuutan" ] },
  { question_text: "仙台", meaning: "宮城県の県庁所在地", answers: [ "sendai", "senndai" ] }
]

meibutsu_questions.each do |q_data|
  question = meibutsu.typing_questions.create!(
    question_text: q_data[:question_text],
    meaning: q_data[:meaning]
  )

  q_data[:answers].each do |answer|
    question.typing_answers.create!(answer_text: answer)
  end
end

# 方言会話コースの問題
marugoto_questions = [
  { question_text: "おはよう靴下だね", meaning: "靴下穴あいてるね", answers: [ "ohayoukutusitadane" ] },
  { question_text: "おめえこばがくせえな", meaning: "「お前は馬鹿みたいだ」", answers: [ "omeekobagakuseena" ] },
  { question_text: "しじゃかぶがいてえ", meaning: "膝が痛い", answers: [ "sijakabugaitee" ] }
]

marugoto_questions.each do |q_data|
  question = marugoto.typing_questions.create!(
    question_text: q_data[:question_text],
    meaning: q_data[:meaning]
  )

  q_data[:answers].each do |answer|
    question.typing_answers.create!(answer_text: answer)
  end
end

puts "シードデータの作成が完了しました！"
puts "コース数: #{Course.count}"
puts "問題数: #{TypingQuestion.count}"
puts "答え数: #{TypingAnswer.count}"
