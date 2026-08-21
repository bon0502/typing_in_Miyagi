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

ActiveRecord::Base.connection.reset_pk_sequence!('courses')

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
  { question_text: "食ってけさいん(くってけさいん)", meaning: "「食べてください」「食べていってください」", answers: [ "kuttekesainn", "kuxtukesainn" ] },
  { question_text: "ごっしゃぐ", meaning: "「怒る」「叱る」など", answers: [ "gossyagu", "goxtusyagu", "gossixyagu" ] },
  { question_text: "しずね", meaning: "「うるさい」「騒がしい」など", answers: [ "sizune" ] },
  { question_text: "ひゃっこい", meaning: "「冷たい」", answers: [ "hyakkoi", "hixyakkoi", "hyaxtukoi" ] },
  { question_text: "いがす", meaning: "「いいよ」「了解」など。地域によって「いらない(不要)」という意味も", answers: [ "igasu" ] },
  { question_text: "やんだ", meaning: "「嫌だ」", answers: [ "yannda", "yanda" ] },
  { question_text: "あぺとぺ", meaning: "訳のわからない。ちんぷんかんぷん。", answers: [ "apetope" ] },
  { question_text: "めんこい", meaning: "「かわいい」「愛らしい」など", answers: [ "menkoi", "mennkoi" ] },
  { question_text: "うるかす", meaning: "「水に浸しておく」「水につけてふかふかにふやかす」など", answers: [ "urukasu" ] },
  { question_text: "なじょして", meaning: "「どうして？」「どうしたらいいのか」など", answers: [ "najyosite", "nazixyosite", "nazyosite" ] },
  { question_text: "うろからする", meaning: "「うろうろする」「落ち着かない」など", answers: [ "urokarasuru" ] },
  { question_text: "えらい", meaning: "「大変だ」「すごい」など", answers: [ "erai" ] },
  { question_text: "くろちよる", meaning: "青タン（アザ）", answers: [ "kurochiyoru", "kurotiyoru" ] },
  { question_text: "けえ", meaning: "「食べろ」", answers: [ "kee" ] },
  { question_text: "けえるのわ", meaning: "「帰るのですか？」", answers: [ "keerunowa" ] },
  { question_text: "しゃね", meaning: "「知らなかった」", answers: [ "syane", "sixyane" ] },
  { question_text: "たまげる", meaning: "「驚く」「びっくりする」など", answers: [ "tamageru" ] },
  { question_text: "とっけす", meaning: "「奪う」", answers: [ "tokkesu", "toxtukesu" ] },
  { question_text: "どんぶく", meaning: "「綿の入った羽織るもの。」", answers: [ "donbuku", "donnbuku" ] },
  { question_text: "なにすや  ", meaning: "「なんだって？」", answers: [ "nanisuya" ] },
  { question_text: "ねっぱす", meaning: "「くっつける」「接着する」「貼り付ける」", answers: [ "neppasu", "naxtupasu" ] },
  { question_text: "もじゃくる", meaning: "(紙など)くしゃくしゃにする。しわくちゃにする。", answers: [ "mojakuru", "mozixyakuru" ] },
  { question_text: "んだ", meaning: "「そうだ」", answers: [ "nda", "nnda" ] },
  { question_text: "もぞこい", meaning: "「かわいそう」", answers: [ "mozokoi" ] },
  { question_text: "すっぱね", meaning: "雨の日に足につく泥はねの事。」", answers: [ "suppane", "suxtupane" ] }
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
  { question_text: "牛タン(ぎゅうたん)", meaning: "仙台名物の焼肉", answers: [ "gyuutann", "gyuutan" ] },
  { question_text: "仙台(せんだい)", meaning: "宮城県の県庁所在地。戦国武将・伊達政宗ゆかりの「仙台城跡」、街を彩るケヤキ並木の美しい「杜の都」としての景観が有名。", answers: [ "sendai", "senndai" ] },
  { question_text: "笹かまぼこ(ささかまぼこ)", meaning: "笹の葉の形をしたかまぼこ", answers: [ "sasakamaboko" ] },
  { question_text: "はらこ飯(はらこめし)", meaning: "鮭の煮汁で炊いたご飯に、大ぶりの鮭の身とイクラを敷き詰めたご飯", answers: [ "harakomeshi", "harakomesi" ] },
  { question_text: "ずんだ餅(ずんだもち)", meaning: "ずんだを餅にかけたもの", answers: [ "zundamoti", "zundamochi", "zunndamoti" ] },
  { question_text: "せり鍋(せりなべ)", meaning: "せりを根っこから葉まで使った鍋料理", answers: [ "serinabe" ] },
  { question_text: "仙台牛(せんだいぎゅう)", meaning: "宮城県産の黒毛和牛", answers: [ "sendaigyu", "senndaigyuu","senndaigixyuu", "sendaigixyuu" ] },
  { question_text: "仙台麻婆焼きそば(せんだいまーぼーやきそば)", meaning: "焼いた、または揚げた中華麺のうえに麻婆豆腐がかかった仙台のソウルフード", answers: [ "sendaima-bo-yakisoba", "senndaima-bo-yakisoba" ] },
  { question_text: "ずんだシェイク(ずんだしぇいく)", meaning: "ずんだを使ったシェイク", answers: [ "zundasyeiku", "zunndasyeiku", "zunndasixeiku", "zundasixeiku" ] },
  { question_text: "ひょうたん揚げ(ひょうたんあげ)", meaning: "塩味のきいた丸いかまぼこに、ほんのり甘めの衣をまとわせて揚げたアメリカンドッグの蒲鉾バージョン。", answers: [ "hyoutanage", "hixyoutanage", "hixyoutannage", "hyoutannage" ] },
  { question_text: "三角あぶら揚げ(さんかくあぶらあげ)", meaning: "3cmもの厚さがあるあぶら揚げ、おすすめは揚げたてに七味と醤油をかけていただく食べ方。香ばしさと素朴な味わいが口いっぱいに広がります。", answers: [ "sankakuaburaage", "sannkakuaburaage" ] },
  { question_text: "萩の月(はぎのつき)", meaning: "カスタードクリームをスポンジで包んだお菓子", answers: [ "haginotuki" ] },
  { question_text: "石巻焼きそば(いしのまきやきそば)", meaning: "出汁を吸わせた茶色い麺に目玉焼きを乗せた、二度蒸し製法が特徴のローカル焼きそば。", answers: [ "ishinomakiyakisoba", "isinomakiyakisoba" ] },
  { question_text: "仙台味噌(せんだいみそ)", meaning: "仙台の伝統的な味噌、仙台味噌は、米麹を多く使った甘口の赤味噌で、濃厚でまろやかな味わいが特徴。", answers: [ "sendaimiso", "senndaimiso" ] },
  { question_text: "白石温麺(しろいしうーめん)", meaning: "長さ約9cmの短い乾麺です。製造時に油を一切使わず、小麦粉と塩水だけで作られるため、胃に優しく滑らかな食感が特徴です。", answers: [ "shiroishiu-men", "siroisiu-menn" ] },

  { question_text: "石巻(いしのまき)", meaning: "宮城県の北東部に位置する市、太平洋に面する港町。石ノ森萬画館や多数の猫が暮らす島があることで有名。", answers: [ "ishinomaki", "isinomaki" ] },
  { question_text: "塩釜(しおがま)", meaning: "宮城県のほぼ中央に位置する市、鹽竈神社（塩竈神社）の門前町および水産港湾都市として発展してきた都市", answers: [ "shiogama", "siogama" ] },
  { question_text: "気仙沼(けせんぬま)", meaning: "宮城県の北東端に位置する市。日本一の水揚げ量を誇るカツオやサメ（フカヒレ）などの豊富な海の幸、ご当地グルメの気仙沼ホルモンが有名。", answers: [ "kesennuma", "kesennnuma" ] },
  { question_text: "白石(しろいし)", meaning: "宮城県南部の市。白石城や400年の歴史を持つ名物「白石温麺（うーめん）」、約100頭のキツネとふれあえる「宮城蔵王キツネ村」などで有名。", answers: [ "siroishi", "shiroishi" ] },
  { question_text: "名取(なとり)", meaning: "宮城県の中央南部に位置する市。東北地方最大の都市である仙台市に隣接しており、市内には仙台空港がある。", answers: [ "natori" ] },
  { question_text: "角田(かくだ)", meaning: "宮城県の南部に位置する市。最先端のロケット開発を行う「宇宙のまち」や、国宝・高蔵寺阿弥陀堂などの歴史文化がある。", answers: [ "kakuda" ] },
  { question_text: "多賀城(たがじょう)", meaning: "宮城県のほぼ中央に位置する市。日本三大史跡の一つである「特別史跡 多賀城跡」や「多賀城碑」などの歴史的・文化的スポットがある。", answers: [ "tagajou", "tagajyou", "tagazixyou" ] },
  { question_text: "岩沼(いわぬま)", meaning: "宮城県南部に位置する市。日本三大稲荷の一つ「竹駒神社」や、金運アップのパワースポット「金蛇水神社」がある。", answers: [ "iwanuma" ] },
  { question_text: "登米(とめ)", meaning: "宮城県の北部に位置する市。郷土料理の「はっと（はっと汁）」やご当地グルメの「油麩丼（あぶらふどん）」がある。", answers: [ "tome" ] },
  { question_text: "栗原(くりはら)", meaning: "宮城県の北西部に位置する市。秋の「神の絨毯」と称される紅葉や登山で有名な栗駒山がある。", answers: [ "kurihara" ] },
  { question_text: "大崎(おおさき)", meaning: "宮城県の北西部に位置する市。豊かな自然が生み出す鳴子温泉郷や紅葉の[鳴子峡]、伝統工芸の鳴子こけし、そしてササニシキ発祥の地としての美味しいお米が有名。", answers: [ "oosaki" ] },
  { question_text: "富谷(とみや)", meaning: "宮城県中部に位置する市。宿場町の面影を残す富谷宿観光交流ステーション「とみやど」や、県内最古の酒蔵の日本酒「鳳陽」、特産のブルーベリーなどがある。", answers: [ "tomiya" ] },
  { question_text: "東松島(ひがしまつしま)", meaning: "宮城県の中部に位置する市。航空自衛隊の曲技飛行隊「ブルーインパルス」や日本三大渓の「嵯峨渓」で有名。", answers: [ "higashimatusima", "higasimatusima" ] },
  { question_text: "蔵王(ざおう)", meaning: "宮城県の南部に位置する町。エメラルドグリーンの火口湖「御釜」や、開湯400年を超える「遠刈田温泉」、濃厚な乳製品が揃う「蔵王チーズ」が有名。", answers: [ "zaou" ] },
  { question_text: "七ヶ宿(しちかしゅく)", meaning: "宮城県の南西部に位置する町。宮城県最大級の「七ヶ宿ダム」や「滑津大滝」などの豊かな自然景観が有名。", answers: [ "sitigasyuku", "sitigasixyuku" ] },
  { question_text: "大河原(おおがわら)", meaning: "宮城県の南部に位置する町。奥州街道の宿場町として栄えた町であり「仙南の商都」として発展してきた。", answers: [ "oogawara" ] },
  { question_text: "村田(むらた)", meaning: "宮城県の南部に位置する町。蔵の町、「スポーツランドSUGO」がある。", answers: [ "murata" ] },
  { question_text: "柴田(しばた)", meaning: "宮城県の南部に位置する町。白石川堤一目千本桜および船岡城址公園が桜の名所として知られ、開花期には多くの観光客が集まる。", answers: [ "sibata", "shibata" ] },
  { question_text: "川崎(かわさき)", meaning: "宮城県の南西部の町。みちのく杜の湖畔公園がある。", answers: [ "kawasaki" ] },
  { question_text: "丸森(まるもり)", meaning: "宮城県の最南端に位置する町。町域の約7割が山林で、その北部を南西から北東方向に阿武隈山地を分断する形で阿武隈川が流れる。", answers: [ "marumori" ] },
  { question_text: "亘理(わたり)", meaning: "宮城県の南部に位置する町。東は太平洋に面している。郷土料理「はらこ飯」が有名。", answers: [ "watari" ] },
  { question_text: "山元(やまもと)", meaning: "宮城県東南端の太平洋沿岸に位置する町。「いちご」「りんご」「ホッキ貝」の三大特産品や、いちご狩りなどが観光名所。", answers: [ "yamamoto" ] },
  { question_text: "七ヶ浜(しちがはま)", meaning: "宮城県中部の太平洋沿岸に位置する町。皇室献上品にも選ばれる高品質な「海苔」や、松島湾の島々を一望する「多聞山」が有名。", answers: [ "sitigahama" ] },
  { question_text: "松島(まつしま)", meaning: "宮城県の沿岸地域中部に位置する町。日本三景の一つに数えられる松島として有名。", answers: [ "matusima" ] },
  { question_text: "利府(りふ)", meaning: "宮城県の中部に位置する町。大規模なスポーツ・商業施設があることで有名。", answers: [ "rifu", "rihu" ] },
  { question_text: "大和(たいわ)", meaning: "宮城県の中部に位置する町。シンボルである「七ツ森」や宿場町の歴史、映画の舞台となった「吉岡宿」、そして特産品の「伊達いわな」が有名。", answers: [ "taiwa" ] },
  { question_text: "大郷(おおさと)", meaning: "宮城県の中部に位置する町。特産品のモロヘイヤや仙台牛の産地として有名。", answers: [ "oosato" ] },
  { question_text: "色麻(しかま)", meaning: "宮城県の北西部に位置する町。町おこしのシンボルにもなっている「河童（かっぱ）の伝説」と、約1万株が咲き誇る初夏の「愛宕山公園のシャクヤク」が有名。", answers: [ "sikama", "shikama" ] },
  { question_text: "加美(かみ)", meaning: "宮城県の北西部に位置する町。東北最大級の花畑が広がる「やくらいガーデン」がある。", answers: [ "kami" ] },
  { question_text: "涌谷(わくや)", meaning: "宮城県の北東部に位置する町。奈良時代に日本で初めて金が産出された「日本初の産金地」としての歴史がある。", answers: [ "wakuya" ] },
  { question_text: "美里(みさと)", meaning: "宮城県の北部に位置する町。安産の神様として知られる「山神社」や、JR小牛田駅の名物駅弁「とりめし」、地酒の「黄金澤」などがあります。", answers: [ "misato" ] },
  { question_text: "女川(おながわ)", meaning: "宮城県の太平洋沿岸に位置する町。日本有数の湊港として知られている。", answers: [ "onagawa" ] },
  { question_text: "南三陸(みなみさんりく)", meaning: "宮城県の北東部の三陸海岸南部に位置する町。南三陸キラキラ丼や志津川タコ、銀鮭、ウニなどの新鮮な海産物グルメと、南三陸さんさん商店街などの観光スポットが有名。", answers: [ "minamisannriku", "minamisanriku" ] },
  { question_text: "大衡(おおひら)", meaning: "宮城県の中部に位置する村。県で唯一の村、豊かな自然と公園がある。カスミ草が県内一の生産量を誇る。", answers: [ "oohira" ] }
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
