# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Admin.create(email: "test@gmail.com", password: 123456)
Customer.create(name_last_kanji: "伊藤", name_first_kanji: "大輝", name_last_kana: "イトウ", name_first_kana: "ダイキ", email: "itodai1001@gmail.com", password: 123456, phone_number: "08033025581")
Genre.create(name: "ケーキ")
Genre.create(name: "プリン")
Genre.create(name: "焼き菓子")
Genre.create(name: "キャンディ")