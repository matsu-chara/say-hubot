# say-hubot

* twitterからTLを取得して[SayKotoeri2](https://sites.google.com/site/nicohemus/home/saykotoeri2)を使って喋ります

## 準備
1. 以下の環境変数を保存

```sh
# hubot-twitter-userstream
export HUBOT_NAME="hubot"
export HUBOT_ROOM_NAME="Twitter"
export HUBOT_TWITTER_KEY=""
export HUBOT_TWITTER_SECRET=""
export HUBOT_TWITTER_TOKEN=""
export HUBOT_TWITTER_TOKEN_SECRET=""

1. `bin/hubot -a twitter-userstream`で受付開始
