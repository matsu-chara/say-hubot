# say-hubot

hubotにTwitterのTLを読み上げさせたりするやつです(mac用)

* 発言を取得してsayコマンドを使って喋ります

* 先頭がスペースの場合は喋りません。(`/^[^\s].*$/`)

## 準備

* システム環境設定＞音声入力と読み上げ＞テキスト読み上げから日本語用音声(Kyoko, Otoya)を設定

* 環境変数で`export SAY_HUBOT_ENGLISH_VOICE="Alex"`, `export SAY_HUBOT_JAPANESE_VOICE="Otoya"`のように英語・日本語音声を指定

* アダプターごとの環境変数を保存

* `bin/hubot -a {adopter_name}`で受付開始


#### メモ

hubot-twitter-userstreamを使う場合＆自分の発言を拾わせたい場合は`node_modules/hubot-twitter-userstream/src/twitter-userstream.coffee`の`stream.on 'tweet', (tweet) =>`の次の行(63行目)をコメントアウトするとできる
