# Description:
#

sh = require 'execSync'

module.exports = (robot) ->
  robot.hear /^[^\s].*$/i, (msg) ->
    sh.run "SayKotoeri2 \"#{msg.envelope.message.text}\""
