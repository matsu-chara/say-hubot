# Description:
#

sh = require 'execSync'

module.exports = (robot) ->
  robot.hear /^[^\s].*$/i, (msg) ->
    text = msg.envelope.message.text
    user = msg.envelope.message.user.name

    console.log "@#{user} #{text}"

    say_text = text
                .replace(/http[s]*:\/\/.*/g, '')
                .replace(/['`]/g, '')

    sh.run "say \"@#{user} #{say_text}\"" if say_text isnt ''
