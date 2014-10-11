# Description:
#

sh = require 'execSync'

module.exports = (robot) ->
  robot.hear /^[^\s].*$/i, (msg) ->
    text = msg.envelope.message.text
          .replace(/http[s]*:\/\/.*/g,'')
          .replace(/[\\*+.?(){}\[\]^$\-|/]/g,'')
          .replace(/[«]/g,'')

    console.log msg.envelope.message.text
    sh.run "SayKotoeri2 \"#{text}\"" if text isnt ''
