# Description:
#

sh = require 'execSync'

module.exports = (robot) ->
  robot.hear /^[^\s].*$/i, (msg) ->
    text = msg.envelope.message.text
          .replace(/http[s]*:\/\/.*/g,'')

    console.log msg.envelope.message.text
    sh.run "say \"#{text}\"" if text isnt ''
