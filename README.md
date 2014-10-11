# say-hubot

hubotにTwitterのTLを読み上げさせたりするやつです(mac用)

* 発言を取得して[SayKotoeri2](https://sites.google.com/site/nicohemus/home/saykotoeri2)を使って喋ります

* 先頭がスペースの場合は喋りません。(`/^[^\s].*$/`)

## 準備

* SayKotoeri2をインストール

* アダプターごとの環境変数を保存

* `bin/hubot -a {adopter_name}`で受付開始
