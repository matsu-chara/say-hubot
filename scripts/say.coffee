# Description:
#

sh = require 'execSync'

module.exports = (robot) ->
  robot.hear /^[^\s].*$/i, (msg) ->
    text = msg.envelope.message.text.replace(/[\\*+.?(){}\[\]^$\-|/]/g,'')
    sh.run "SayKotoeri2 \"#{text}\"" if text isnt ''
