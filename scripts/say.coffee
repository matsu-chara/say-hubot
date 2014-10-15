# Description:
#

sh = require 'execSync'

isAscii = (text) ->
  code =
    sh.run "echo \"#{text}\" | nkf -g | xargs -I {} test {} = ASCII"

  return if code == 0 then true else false

getVoice = (text) ->
  enVoice = process.env.SAY_HUBOT_ENGLISH_VOICE ? "Alex"
  jpVoice = process.env.SAY_HUBOT_JAPANESE_VOICE ? "Otoya"

  return if isAscii(text) then enVoice else jpVoice

module.exports = (robot) ->
  robot.hear /^[^\s].*$/i, (msg) ->
    text = msg.envelope.message.text
    user = msg.envelope.message.user.name
    console.log "@#{user}, #{text}"

    sayText = text
                .replace(/http[s]*:\/\/.*/g, '')
                .replace(/['`]/g, '')
    voice = getVoice(sayText)
    sh.run "say -v #{voice} \"@#{user}, #{sayText}\"" if sayText isnt ''
