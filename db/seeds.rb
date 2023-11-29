# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# テストデータ

# ユーザー
kirahoshi = User.find_or_create_by!(user_name: "きらほし") do |user|
  user.email         = "kirahoshi@example.com"
  user.password      = "kira1922ssssf"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

alice = User.find_or_create_by!(user_name: "アリス") do |user|
  user.email         = "alice@example.com"
  user.password      = "alice122xx"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

bob = User.find_or_create_by!(user_name: "ボブ") do |user|
  user.email         = "bob@example.com"
  user.password      = "bob12pppxx"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

miku = User.find_or_create_by!(user_name: "美久") do |user|
  user.email         = "miku@example.com"
  user.password      = "miku2222xxx"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
end

hinahina = User.find_or_create_by!(user_name: "ひなひな") do |user|
  user.email         = "hinahina@example.com"
  user.password      = "hina22hina"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
end

hideki = User.find_or_create_by!(user_name: "ひでき") do |user|
  user.email         = "hideki@example.com"
  user.password      = "hideki9999"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
end

masashi = User.find_or_create_by!(user_name: "まさし@アニメ大好き") do |user|
  user.email         = "masashi@example.com"
  user.password      = "masashi0s0s"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
end

mugi = User.find_or_create_by!(user_name: "むぎちゃん") do |user|
  user.email         = "mugi@example.com"
  user.password      = "mugimugi222"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")
end

kimimaro = User.find_or_create_by!(user_name: "きみまろ") do |user|
  user.email         = "kimimaro@example.com"
  user.password      = "mugimugi222"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")
end

moroq = User.find_or_create_by!(user_name: "もろQ") do |user|
  user.email         = "moroq@example.com"
  user.password      = "moroq222112"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")
end

saeri = User.find_or_create_by!(user_name: "さえり") do |user|
  user.email         = "saeri@example.com"
  user.password      = "saerit3r33"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")
end

# ジャンル
Genre.find_or_create_by!(name: "ジャンルなし");
Genre.find_or_create_by!(name: "悩み事");
Genre.find_or_create_by!(name: "アニメ");
Genre.find_or_create_by!(name: "ゲーム");
Genre.find_or_create_by!(name: "映画");
Genre.find_or_create_by!(name: "ドラマ");
Genre.find_or_create_by!(name: "恋愛");
Genre.find_or_create_by!(name: "音楽");
Genre.find_or_create_by!(name: "スポーツ");
Genre.find_or_create_by!(name: "芸術");
Genre.find_or_create_by!(name: "旅行");
Genre.find_or_create_by!(name: "料理");
Genre.find_or_create_by!(name: "趣味");
Genre.find_or_create_by!(name: "ファッション");
Genre.find_or_create_by!(name: "推し活");

# 投稿
post1 = Post.find_or_create_by!(user_id: 1, genre_id: 1) do |post|
  post.message     = "渋谷に遊んでいたら有名人の〇〇と会いました。興奮して写真を撮っちゃった。"
  post.review_item = "びっくり"
  post.post_image  = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
end

post2 = Post.find_or_create_by!(user_id: 1, genre_id: 5) do |post|
  post.message = "最近、公開された映画〇〇が気になっているのですが、観た人いますか？"
  post.review_item = "絶対見るべき！"
end

post3 = Post.find_or_create_by!(user_id: 1, genre_id: 13) do |post|
  post.message     = "カフェ巡りが趣味なのですが、お気に入りのカフェを見つけちゃいました。"
  post.review_item = "おしゃれ"
  post.post_image  = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
end

post4 = Post.find_or_create_by!(user_id: 2, genre_id: 14) do |post|
  post.message     = "この服買おうか迷っているのですが、どう思いますか？"
  post.review_item = "おしゃれ"
  post.post_image  = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
end

post5 = Post.find_or_create_by!(user_id: 2, genre_id: 15) do |post|
  post.message     = "私、男性アイドルの〇〇が推しなのですが、皆さん知っていますか？"
  post.review_item = "好きです！"
end

post6 = Post.find_or_create_by!(user_id: 3, genre_id: 8) do |post|
  post.message     = "前から行きたかったバンドのライブに行ってきました。最高に楽しかったです。"
  post.review_item = "羨ましい"
  post.post_image  = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
end

post7 = Post.find_or_create_by!(user_id: 4, genre_id: 11) do |post|
  post.message     = "長期で休みがもらえたので、彼氏とドバイに行ってきました。夜景が綺麗でした。"
  post.review_item = "行ってみたい"
  post.post_image  = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg")
end

post8 = Post.find_or_create_by!(user_id: 4, genre_id: 4) do |post|
  post.message     = "今話題のス〇〇ゲームが気になっていたので、始めてみました。〇〇点までいけたのですが、これってすごいですか？"
  post.review_item = "すごい"
end

post9 = Post.find_or_create_by!(user_id: 4, genre_id: 6) do |post|
  post.message     = "今期のドラマ〇〇って見た方がいいですか？初回を見逃してしまったのでスルーしていたのですが"
  post.review_item = "見るべき"
end

post10 = Post.find_or_create_by!(user_id: 5, genre_id: 3) do |post|
  post.message     = "今期のアニメ〇〇って見た方がいいですか？友達が面白いと言っていたので気になっています"
  post.review_item = "見るべき"
end

post11 = Post.find_or_create_by!(user_id: 5, genre_id: 12) do |post|
  post.message     = "昨日、料理サイトを見ながらもつ鍋に挑戦してみました。初めて作りましたが、ビックリするぐらい美味しかったです。"
  post.review_item = "美味しそう"
  post.post_image  = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg")
end

post12 = Post.find_or_create_by!(user_id: 6, genre_id: 13) do |post|
  post.message     = "久しぶりに海釣りに行きました。30cm越えの鯛が釣れました。"
  post.review_item = "すごすぎる"
  post.post_image  = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg")
end

post13 = Post.find_or_create_by!(user_id: 3, genre_id: 2) do |post|
  post.message     = "現在の会社に勤めて2年になるのですが、第二新卒のうちに転職しようか迷っています。転職経験者にお聞きしたいのですが、転職して良かったと思いますか？"
  post.review_item = "転職して良かった"
end

post14 = Post.find_or_create_by!(user_id: 7, genre_id: 10) do |post|
  post.message     = "絵を描くのが好きなのですが、1週間かけて満足のいく絵を描くことができました。"
  post.review_item = "上手すぎる"
  post.post_image  = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg")
end

post15 = Post.find_or_create_by!(user_id: 7, genre_id: 2) do |post|
  post.message     = "同じクラスに好きな人がいます。告白してもふられると思うのですが、それでも告白するべきですか？"
  post.review_item = "告白するべき"
end

post16 = Post.find_or_create_by!(user_id: 2, genre_id: 1, review_item: "利用していきたい") do |post|
  post.message = "「きらほし」というサイトの使い心地はどうですか？今後も利用したいと思えますか？"
  post.review_item = "使いやすい"
end

post17 = Post.find_or_create_by!(user_id: 2, genre_id: 12) do |post|
  post.message     = "昨日、オムライスを作ってみました。出来はどうですか？"
  post.review_item = "プロが作ったみたい"
  post.post_image  = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
end


# レビュー
Review.find_or_create_by!(user_id: 1, post_id: 14) do |review|
  review.rate    = 5.0
  review.comment = "上手すぎてビックリしました"
end

Review.find_or_create_by!(user_id: 5, post_id: 14) do |review|
  review.rate    = 3.0
  review.comment = "まあまあですね"
end

Review.find_or_create_by!(user_id: 1, post_id: 15) do |review|
  review.rate    = 4.5
  review.comment = "絶対告白するべきです。応援しています"
end

Review.find_or_create_by!(user_id: 2, post_id: 15) do |review|
  review.rate    = 4.0
end

Review.find_or_create_by!(user_id: 5, post_id: 15) do |review|
  review.rate    = 3.0
  review.comment = "慎重にいきましょう"
end

Review.find_or_create_by!(user_id: 6, post_id: 15) do |review|
  review.rate    = 3.0
  review.comment = "慎重にいきましょう"
end

Review.find_or_create_by!(user_id: 7, post_id: 16) do |review|
  review.rate    = 3.0
end

Review.find_or_create_by!(user_id: 8, post_id: 16) do |review|
  review.rate    = 2.0
end

Review.find_or_create_by!(user_id: 7, post_id: 15) do |review|
  review.rate    = 1.0
  review.comment = "私なら絶対にしないです"
end

Review.find_or_create_by!(user_id: 4, post_id: 16) do |review|
  review.rate    = 5.0
  review.comment = "今後も使っていきたいです"
end

Review.find_or_create_by!(user_id: 1, post_id: 17) do |review|
  review.rate    = 5.0
  review.comment = "とても美味しそうです"
end

Review.find_or_create_by!(user_id: 3, post_id: 17) do |review|
  review.rate    = 3.0
  review.comment = "僕もこんなオムライス作れるようになりたいです"
end

Review.find_or_create_by!(user_id: 4, post_id: 17) do |review|
  review.rate    = 2.5
  review.comment = "まあまあだと思います"
end

Review.find_or_create_by!(user_id: 5, post_id: 17) do |review|
  review.rate    = 2.0
  review.comment = "プロ並みです"
end

Review.find_or_create_by!(user_id: 6, post_id: 17) do |review|
  review.rate    = 1.0
  review.comment = "すごすぎます"
end

Review.find_or_create_by!(user_id: 7, post_id: 17) do |review|
  review.rate    = 1.0
  review.comment = "あんまりですね"
end

Review.find_or_create_by!(user_id: 8, post_id: 17) do |review|
  review.rate    = 0.5
end

Review.find_or_create_by!(user_id: 9, post_id: 17) do |review|
  review.rate    = 3.5
end

Review.find_or_create_by!(user_id: 10, post_id: 17) do |review|
  review.rate    = 4.0
  review.comment = "美味しそう"
end

Review.find_or_create_by!(user_id: 11, post_id: 17) do |review|
  review.rate    = 4.0
  review.comment = "プロが作ったと思いました"
end

# タグ
Tag.find_or_create_by!(name: "料理");
Tag.find_or_create_by!(name: "芸能人");
Tag.find_or_create_by!(name: "ビックリ");
Tag.find_or_create_by!(name: "隠し撮り");
Tag.find_or_create_by!(name: "渋谷");
Tag.find_or_create_by!(name: "お出かけ");
Tag.find_or_create_by!(name: "映画");
Tag.find_or_create_by!(name: "質問");
Tag.find_or_create_by!(name: "カフェ");
Tag.find_or_create_by!(name: "趣味");
Tag.find_or_create_by!(name: "街めぐり");
Tag.find_or_create_by!(name: "おしゃれ");
Tag.find_or_create_by!(name: "ファッション");
Tag.find_or_create_by!(name: "女性");
Tag.find_or_create_by!(name: "男性");
Tag.find_or_create_by!(name: "アイドル");
Tag.find_or_create_by!(name: "オタク");
Tag.find_or_create_by!(name: "推し活");
Tag.find_or_create_by!(name: "バンド");
Tag.find_or_create_by!(name: "音楽");
Tag.find_or_create_by!(name: "休み");
Tag.find_or_create_by!(name: "旅行");
Tag.find_or_create_by!(name: "自慢");
Tag.find_or_create_by!(name: "夜景");
Tag.find_or_create_by!(name: "ゲーム");
Tag.find_or_create_by!(name: "初心者");
Tag.find_or_create_by!(name: "話題");
Tag.find_or_create_by!(name: "ドラマ");
Tag.find_or_create_by!(name: "エンタメ");
Tag.find_or_create_by!(name: "アニメ");
Tag.find_or_create_by!(name: "モツ鍋");
Tag.find_or_create_by!(name: "初挑戦");
Tag.find_or_create_by!(name: "休日");
Tag.find_or_create_by!(name: "釣り");
Tag.find_or_create_by!(name: "絵画");
Tag.find_or_create_by!(name: "釣り");
Tag.find_or_create_by!(name: "学生");
Tag.find_or_create_by!(name: "恋愛");
Tag.find_or_create_by!(name: "告白");
Tag.find_or_create_by!(name: "悩み");
Tag.find_or_create_by!(name: "社会人");
Tag.find_or_create_by!(name: "サラリーマン");
Tag.find_or_create_by!(name: "第二新卒");
Tag.find_or_create_by!(name: "転職");

TagRelationship.find_or_create_by!(post_id: 1, tag_id: 2);
TagRelationship.find_or_create_by!(post_id: 1, tag_id: 3);
TagRelationship.find_or_create_by!(post_id: 1, tag_id: 4);
TagRelationship.find_or_create_by!(post_id: 1, tag_id: 5);
TagRelationship.find_or_create_by!(post_id: 1, tag_id: 6);
TagRelationship.find_or_create_by!(post_id: 1, tag_id: 15);
TagRelationship.find_or_create_by!(post_id: 1, tag_id: 21);
TagRelationship.find_or_create_by!(post_id: 1, tag_id: 23);
TagRelationship.find_or_create_by!(post_id: 1, tag_id: 27);
TagRelationship.find_or_create_by!(post_id: 1, tag_id: 33);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 6);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 7);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 8);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 10);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 21);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 27);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 29);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 30);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 33);
TagRelationship.find_or_create_by!(post_id: 2, tag_id: 37);
TagRelationship.find_or_create_by!(post_id: 3, tag_id: 6);
TagRelationship.find_or_create_by!(post_id: 3, tag_id: 9);
TagRelationship.find_or_create_by!(post_id: 3, tag_id: 10);
TagRelationship.find_or_create_by!(post_id: 3, tag_id: 11);
TagRelationship.find_or_create_by!(post_id: 3, tag_id: 12);
TagRelationship.find_or_create_by!(post_id: 3, tag_id: 14);
TagRelationship.find_or_create_by!(post_id: 3, tag_id: 21);
TagRelationship.find_or_create_by!(post_id: 3, tag_id: 36);
TagRelationship.find_or_create_by!(post_id: 4, tag_id: 8);
TagRelationship.find_or_create_by!(post_id: 4, tag_id: 13);
TagRelationship.find_or_create_by!(post_id: 4, tag_id: 14);
TagRelationship.find_or_create_by!(post_id: 4, tag_id: 39);
TagRelationship.find_or_create_by!(post_id: 5, tag_id: 2);
TagRelationship.find_or_create_by!(post_id: 5, tag_id: 8);
TagRelationship.find_or_create_by!(post_id: 5, tag_id: 10);
TagRelationship.find_or_create_by!(post_id: 5, tag_id: 15);
TagRelationship.find_or_create_by!(post_id: 5, tag_id: 16);
TagRelationship.find_or_create_by!(post_id: 5, tag_id: 17);
TagRelationship.find_or_create_by!(post_id: 5, tag_id: 18);
TagRelationship.find_or_create_by!(post_id: 5, tag_id: 20);
TagRelationship.find_or_create_by!(post_id: 5, tag_id: 27);
TagRelationship.find_or_create_by!(post_id: 6, tag_id: 2);
TagRelationship.find_or_create_by!(post_id: 6, tag_id: 6);
TagRelationship.find_or_create_by!(post_id: 6, tag_id: 10);
TagRelationship.find_or_create_by!(post_id: 6, tag_id: 15);
TagRelationship.find_or_create_by!(post_id: 6, tag_id: 19);
TagRelationship.find_or_create_by!(post_id: 6, tag_id: 20);
TagRelationship.find_or_create_by!(post_id: 6, tag_id: 21);
TagRelationship.find_or_create_by!(post_id: 6, tag_id: 23);
TagRelationship.find_or_create_by!(post_id: 6, tag_id: 36);
TagRelationship.find_or_create_by!(post_id: 7, tag_id: 6);
TagRelationship.find_or_create_by!(post_id: 7, tag_id: 12);
TagRelationship.find_or_create_by!(post_id: 7, tag_id: 21);
TagRelationship.find_or_create_by!(post_id: 7, tag_id: 22);
TagRelationship.find_or_create_by!(post_id: 7, tag_id: 23);
TagRelationship.find_or_create_by!(post_id: 7, tag_id: 24);
TagRelationship.find_or_create_by!(post_id: 7, tag_id: 33);
TagRelationship.find_or_create_by!(post_id: 7, tag_id: 37);
TagRelationship.find_or_create_by!(post_id: 8, tag_id: 3);
TagRelationship.find_or_create_by!(post_id: 8, tag_id: 10);
TagRelationship.find_or_create_by!(post_id: 8, tag_id: 23);
TagRelationship.find_or_create_by!(post_id: 8, tag_id: 25);
TagRelationship.find_or_create_by!(post_id: 8, tag_id: 26);
TagRelationship.find_or_create_by!(post_id: 8, tag_id: 27);
TagRelationship.find_or_create_by!(post_id: 9, tag_id: 8);
TagRelationship.find_or_create_by!(post_id: 9, tag_id: 27);
TagRelationship.find_or_create_by!(post_id: 9, tag_id: 28);
TagRelationship.find_or_create_by!(post_id: 9, tag_id: 29);
TagRelationship.find_or_create_by!(post_id: 9, tag_id: 37);
TagRelationship.find_or_create_by!(post_id: 10, tag_id: 8);
TagRelationship.find_or_create_by!(post_id: 10, tag_id: 10);
TagRelationship.find_or_create_by!(post_id: 10, tag_id: 18);
TagRelationship.find_or_create_by!(post_id: 10, tag_id: 27);
TagRelationship.find_or_create_by!(post_id: 10, tag_id: 29);
TagRelationship.find_or_create_by!(post_id: 10, tag_id: 30);
TagRelationship.find_or_create_by!(post_id: 10, tag_id: 36);
TagRelationship.find_or_create_by!(post_id: 11, tag_id: 1);
TagRelationship.find_or_create_by!(post_id: 11, tag_id: 3);
TagRelationship.find_or_create_by!(post_id: 11, tag_id: 21);
TagRelationship.find_or_create_by!(post_id: 11, tag_id: 26);
TagRelationship.find_or_create_by!(post_id: 11, tag_id: 31);
TagRelationship.find_or_create_by!(post_id: 11, tag_id: 32);
TagRelationship.find_or_create_by!(post_id: 12, tag_id: 3);
TagRelationship.find_or_create_by!(post_id: 12, tag_id: 6);
TagRelationship.find_or_create_by!(post_id: 12, tag_id: 10);
TagRelationship.find_or_create_by!(post_id: 12, tag_id: 21);
TagRelationship.find_or_create_by!(post_id: 12, tag_id: 23);
TagRelationship.find_or_create_by!(post_id: 12, tag_id: 34);
TagRelationship.find_or_create_by!(post_id: 12, tag_id: 40);
TagRelationship.find_or_create_by!(post_id: 13, tag_id: 8);
TagRelationship.find_or_create_by!(post_id: 13, tag_id: 39);
TagRelationship.find_or_create_by!(post_id: 13, tag_id: 40);
TagRelationship.find_or_create_by!(post_id: 13, tag_id: 41);
TagRelationship.find_or_create_by!(post_id: 13, tag_id: 42);
TagRelationship.find_or_create_by!(post_id: 13, tag_id: 43);
TagRelationship.find_or_create_by!(post_id: 14, tag_id: 10);
TagRelationship.find_or_create_by!(post_id: 14, tag_id: 23);
TagRelationship.find_or_create_by!(post_id: 14, tag_id: 35);
TagRelationship.find_or_create_by!(post_id: 14, tag_id: 36);
TagRelationship.find_or_create_by!(post_id: 15, tag_id: 8);
TagRelationship.find_or_create_by!(post_id: 15, tag_id: 37);
TagRelationship.find_or_create_by!(post_id: 15, tag_id: 38);
TagRelationship.find_or_create_by!(post_id: 15, tag_id: 39);
TagRelationship.find_or_create_by!(post_id: 17, tag_id: 1);
TagRelationship.find_or_create_by!(post_id: 17, tag_id: 8);
TagRelationship.find_or_create_by!(post_id: 17, tag_id: 10);
TagRelationship.find_or_create_by!(post_id: 17, tag_id: 12);
TagRelationship.find_or_create_by!(post_id: 17, tag_id: 23);
TagRelationship.find_or_create_by!(post_id: 17, tag_id: 33);

# レベル設定
LevelSetting.find_or_create_by!(level: 1,  thresold: 3);
LevelSetting.find_or_create_by!(level: 2,  thresold: 5);
LevelSetting.find_or_create_by!(level: 3,  thresold: 6);
LevelSetting.find_or_create_by!(level: 4,  thresold: 7);
LevelSetting.find_or_create_by!(level: 5,  thresold: 8);
LevelSetting.find_or_create_by!(level: 6,  thresold: 9);
LevelSetting.find_or_create_by!(level: 7,  thresold: 10);
LevelSetting.find_or_create_by!(level: 8,  thresold: 11);
LevelSetting.find_or_create_by!(level: 9,  thresold: 12);
LevelSetting.find_or_create_by!(level: 10, thresold: 13);
LevelSetting.find_or_create_by!(level: 11, thresold: 14);
LevelSetting.find_or_create_by!(level: 12, thresold: 15);
LevelSetting.find_or_create_by!(level: 13, thresold: 16);
LevelSetting.find_or_create_by!(level: 14, thresold: 17);
LevelSetting.find_or_create_by!(level: 15, thresold: 18);
LevelSetting.find_or_create_by!(level: 16, thresold: 19);
LevelSetting.find_or_create_by!(level: 17, thresold: 20);
LevelSetting.find_or_create_by!(level: 18, thresold: 21);
LevelSetting.find_or_create_by!(level: 19, thresold: 22);
LevelSetting.find_or_create_by!(level: 20, thresold: 23);
LevelSetting.find_or_create_by!(level: 21, thresold: 24);
LevelSetting.find_or_create_by!(level: 22, thresold: 25);
LevelSetting.find_or_create_by!(level: 23, thresold: 26);
LevelSetting.find_or_create_by!(level: 24, thresold: 27);
LevelSetting.find_or_create_by!(level: 25, thresold: 28);
LevelSetting.find_or_create_by!(level: 26, thresold: 29);
LevelSetting.find_or_create_by!(level: 27, thresold: 30);
LevelSetting.find_or_create_by!(level: 28, thresold: 31);
LevelSetting.find_or_create_by!(level: 29, thresold: 32);
LevelSetting.find_or_create_by!(level: 30, thresold: 99999);


# 管理者
administrator = Admin.find_or_create_by!(email: "kiraAdmin@example.com") do |admin|
  admin.password = "kiraAdmin0001"
end