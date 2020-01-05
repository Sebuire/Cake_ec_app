# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Admin.create(email: "test@gmail.com", password: 123456)
# Customer.create(name_last_kanji: "伊藤", name_first_kanji: "大輝", name_last_kana: "イトウ", name_first_kana: "ダイキ", email: "itodai1001@gmail.com", password: 123456, phone_number: "08033025581")
# Genre.create(name: "ケーキ")
# Genre.create(name: "プリン")
# Genre.create(name: "焼き菓子")
# Genre.create(name: "キャンディ")
# Address.create(customer_id: 1, address: "神奈川県川崎市川崎区8-1-1102", postal_code: 1802291)
# Order.create(customer_id: 1, postage: 800, total_price: 3300, order_name: "伊東大輝", order_address: "神奈川県川崎市川崎区8-1-1102", order_postal_code: 1802291)
# Item.create(genre_id: 2, name: "うれしいプリン 6個セット", body: "定番カスタードプリンの詰め合わせです。ほろにがカラメルの上は、濃厚カスタード味のプリンです。保存料を一切使用していません。長野県産「こだわり卵」を使って、毎朝手作りしています。「おいしい」や「うまい」の先にある「うれしい」をお届けします", price: 2000)
# Item.create(genre_id: 3, name: "ラングドシャ", body: "可愛らしい猫の缶にぎっしり入っているのは、ごく薄く焼き上げた繊細なクッキー。「ラングドシャ」とはフランス語で「猫の舌」という意味です。", price: 1500)
# Item.create(genre_id: 4, name: "お正月MIX", body: "金色に輝くのパッケージが目印の「お正月MIX」。お正月らしいデザイン、カラーのＭＩＸです。フレーバーも人気のフレーバーを揃えています。", price: 500)
# Item.create(genre_id: 1, name: "いちご生チョコデコレーション 3号", body: "柔らかなスポンジとブレンドの生クリームにたっぷりのベリーをトッピング、さっぱりと召し上がって頂けるよう仕上げました。作りたてを急速冷凍しお届けしますので、解凍後もフレッシュなお味を楽しめます。", price: 2200)
# Item.create(genre_id: 1, name: "ドゥーブル・フロマージュ　4号", body: "北海道産のクリームチーズとマスカルポーネを使ったふわふわなスフレチーズと、とろとろした口どけのレアチーズの２層になった贅沢なチーズケーキです。", price: 2500)
# Item.create(genre_id: 1, name: "苺盛りデコレーションケーキ 5号", body: "目玉商品！定番人気の苺のケーキ！国産高級苺をふんだんに飾り、自家製苺のジュレで仕上げました。", price: 4500)
# Item.create(genre_id: 1, name: "いちご生クリーム 5号", body: "中にはイチゴをサンドし、上には口溶けの良い生チョコとイチゴをたっぷり乗せてデコレーションしました。", price: 3000)
# Item.create(genre_id: 2, name: "有機プリン", body: "長野の農薬不使用原材料にこだわり、JAS認定の厳しい審査を経て完成した100%有機素材です。なかなか味わえないプリンを、是非ご賞味下さい。", price: 7000)
# Item.create(genre_id: 2, name: "龍のたまごの手作りプリン 6個セット", body: "味の決め手は、大分県速見郡日出町の農場から届く卵。天然配合飼料に乳酸菌を加えた独自の飼料、こだわりの水、豊かな自然の中で育てた母鶏が産んだ卵は、高い栄養価と濃い黄色、コクのある味わいが魅力です。", price: 3000)
# Item.create(genre_id: 2, name: "カタラーナ 6個セット", body: "アイス感覚でお楽しみいただける新食感の焼きプリン・フローズンデザートです。厳選した生クリームと牛乳をたっぷりと使い、湯煎で焼き上げた後、表面を２度焼きのキャラメリゼで仕上げました。濃厚でなめらかな甘味とカソナードの絶妙の苦みが香ばしい絶品です。", price: 2500)
# Item.create(genre_id: 3, name: "ビスキュイスペシャル缶（フレンチ＆珈琲）", body: "今回は「フレンチビスキュイ」と「珈琲ビスキュイ」の2味が楽しめるスペシャル缶をご用意。素敵なトリコロール缶にぎっしりと詰めてお届けします。", price: 4800)
# Item.create(genre_id: 3, name: "ウェルカムベビーアイシングクッキー", body: "赤ちゃんの誕生を祝うにふさわしい、ハッピー感が溢れるアイシングクッキーです。", price: 1800)
# Item.create(genre_id: 3, name: "クッキーサンド　12枚入り", body: "2色各6枚ずつ12枚入りで個包装となっています。シャリーン・カールトン氏がデザインするいちごが散りばめられた華やかな箱も女性に喜ばれる可愛いデザインで、ホームパーティのお持たせや、プレゼントにもおすすめです。", price: 1000)
# Item.create(genre_id: 4, name: "冬のピロー「ホワイトモカ＆メープルミルクティー」", body: "今年の冬のピローは、ホワイトチョコが中に入ったエスプレッソキャンディーとメープルミルクティーフレーバーのミックスです。忙しい師走に『ホッと、ひとキャンディー』いかがでしょうか？", price: 500)
# Item.create(genre_id: 4, name: "ピーチ＆マンゴー", body: "ピンクとイエローのストライプがとってもキュートなハート型のロリポップ。ピーチとマンゴーのミックス味で甘酸っぱい美味しさがお口に広がります。", price: 350)
# Item.create(genre_id: 4, name: "ソーダ", body: "ブルーのストライプがクールなハート型のロリポップキャンディーです。飽きのこないソーダ味で最後まで美味しくいただけます。", price: 380)
# OrderItem.update(order_id: 1, item_id: 1, price: 3000, quantity: 1)