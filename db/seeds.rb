# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー
# 7.times do |n|
#   User.create!(
#     user_name: "テストユーザー#{n + 1}",
#     email: "test2#{n + 1}@email.com",
#     password: "test" + "#{n}" * 6,
#     membership_status: 0
#   )
# end

# 管理者
# Admin.create!(email: "adminuser1@email.com", password: "Admin17722ss")

# レビュー
# Review.create!(user_id: 6, post_id: 1, rate: 2.0, comment: "テスト")

# ジャンル
# Genre.create!(name: "ジャンルなし");
# Genre.create!(name: "アニメ");
# Genre.create!(name: "ゲーム");
# Genre.create!(name: "映画");
# Genre.create!(name: "ドラマ");
# Genre.create!(name: "恋愛");
# Genre.create!(name: "音楽");
# Genre.create!(name: "スポーツ");