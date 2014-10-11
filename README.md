# say-hubot

hubotにTwitterのTLを読み上げさせたりするやつです(mac用)

* 発言を取得して[SayKotoeri2](https://sites.google.com/site/nicohemus/home/saykotoeri2)を使って喋ります

* 先頭がスペースの場合は喋りません。(`/^[^\s].*$/`)

## 準備

* SayKotoeri2をインストール

* アダプターごとの環境変数を保存

* `bin/hubot -a {adopter_name}`で受付開始


#### メモ

hubot-twitter-userstreamを使う場合＆自分の発言を拾わせたい場合は`node_modules/hubot-twitter-userstream/src/twitter-userstream.coffee`の`stream.on 'tweet', (tweet) =>`の次の行(63行目)をコメントアウトするとできる
