# Description:
#

sh = require 'execSync'
shellwords = require 'shellwords'

class SayMessage
  constructor: (@user, @text) ->
    @context =
      if @isAsciiMessage() then new EnglishContext else new JapaneseContext

  isAsciiMessage: () =>
    code = sh.run "echo #{shellwords.escape  @text} | nkf -g | xargs -I {} test {} = ASCII"
    return if code == 0 then true else false

  say: () =>
    sh.run "say -v #{shellwords.escape @context.getVoice()} #{shellwords.escape @getSayText()}"

  outputLog: () =>
    console.log @getSayText(true)

  getSayText: (isRaw) =>
    if isRaw
      text = @text
    else
      text = @text
              .replace(/http[s]*:\/\/.*\s/g, '')
              .replace(/^RT\s|\sRT\s/, "#{@context.getRetweet()}, ")
    return "@#{@user}, #{text}"

class Context
  getVoice: () ->

  getRetweet: () ->

class JapaneseContext extends Context
  getVoice: () ->
    return process.env.SAY_HUBOT_JAPANESE_VOICE ? "Otoya"

  getRetweet: () ->
    return "リツイート"

class EnglishContext extends Context
  getVoice: () ->
    return process.env.SAY_HUBOT_ENGLISH_VOICE ? "Alex"

  getRetweet: () ->
    return "retweet"

module.exports = (robot) ->
  robot.hear /^[^\s].*$/i, (msg) ->
    user = msg.envelope.message.user.name
    text = msg.envelope.message.text

    sm = new SayMessage user, text
    sm.outputLog()
    sm.say()
