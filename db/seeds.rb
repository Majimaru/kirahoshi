# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# テストデータ

# ユーザー
# kirahoshi = User.find_or_create_by!(user_name: "きらほし") do |user|
#   user.email = "kirahoshi@example.com"
#   user.password = "kira1922ssssf"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
# end

# alice = User.find_or_create_by!(user_name: "アリス") do |user|
#   user.email = "alice@example.com"
#   user.password = "alice122xx"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
# end

# bob = User.find_or_create_by!(user_name: "ボブ") do |user|
#   user.email = "bob@example.com"
#   user.password = "bob12pppxx"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
# end

# miku = User.find_or_create_by!(user_name: "美久") do |user|
#   user.email = "miku@example.com"
#   user.password = "miku2222xxx"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
# end

# hinahina = User.find_or_create_by!(user_name: "ひなひな") do |user|
#   user.email = "hinahina@example.com"
#   user.password = "hina22hina"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
# end

# hideki = User.find_or_create_by!(user_name: "ひでき") do |user|
#   user.email = "hideki@example.com"
#   user.password = "hideki9999"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
# end

# masashi = User.find_or_create_by!(user_name: "まさし@アニメ大好き") do |user|
#   user.email = "masashi@example.com"
#   user.password = "masashi0s0s"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
# end

# mugi = User.find_or_create_by!(user_name: "むぎちゃん") do |user|
#   user.email = "mugi@example.com"
#   user.password = "mugimugi222"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")
# end

# kimimaro = User.find_or_create_by!(user_name: "きみまろ") do |user|
#   user.email = "kimimaro@example.com"
#   user.password = "mugimugi222"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")
# end

# moroq = User.find_or_create_by!(user_name: "もろQ") do |user|
#   user.email = "moroq@example.com"
#   user.password = "moroq222112"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")
# end

# saeri = User.find_or_create_by!(user_name: "さえり") do |user|
#   user.email = "saeri@example.com"
#   user.password = "saerit3r33"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")
# end


# マスターテーブル
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

# レベル設定
# LevelSetting.find_or_create_by!(level: 2,  thresold: 5);
# LevelSetting.find_or_create_by!(level: 3,  thresold: 6);
# LevelSetting.find_or_create_by!(level: 4,  thresold: 7);
# LevelSetting.find_or_create_by!(level: 5,  thresold: 8);
# LevelSetting.find_or_create_by!(level: 6,  thresold: 9);
# LevelSetting.find_or_create_by!(level: 7,  thresold: 10);
# LevelSetting.find_or_create_by!(level: 8,  thresold: 11);
# LevelSetting.find_or_create_by!(level: 9,  thresold: 12);
# LevelSetting.find_or_create_by!(level: 10, thresold: 13);
# LevelSetting.find_or_create_by!(level: 11, thresold: 14);
# LevelSetting.find_or_create_by!(level: 12, thresold: 15);
# LevelSetting.find_or_create_by!(level: 13, thresold: 16);
# LevelSetting.find_or_create_by!(level: 14, thresold: 17);
# LevelSetting.find_or_create_by!(level: 15, thresold: 18);
# LevelSetting.find_or_create_by!(level: 16, thresold: 19);
# LevelSetting.find_or_create_by!(level: 17, thresold: 20);
# LevelSetting.find_or_create_by!(level: 18, thresold: 21);
# LevelSetting.find_or_create_by!(level: 19, thresold: 22);
# LevelSetting.find_or_create_by!(level: 20, thresold: 23);
# LevelSetting.find_or_create_by!(level: 21, thresold: 24);
# LevelSetting.find_or_create_by!(level: 22, thresold: 25);
# LevelSetting.find_or_create_by!(level: 23, thresold: 26);
# LevelSetting.find_or_create_by!(level: 24, thresold: 27);
# LevelSetting.find_or_create_by!(level: 25, thresold: 28);

# # 管理者
# administrator = Admin.find_or_create_by!(email: "kiraAdmin@example.com") do |admin|
#   admin.password = "kiraAdmin0001"
# end

# レビュー
# Review.create!(user_id: 6, post_id: 1, rate: 2.0, comment: "テスト")