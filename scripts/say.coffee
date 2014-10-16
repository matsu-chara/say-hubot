# Description:
#

sh = require 'execSync'
shellescape = require 'shell-escape'

class SayMessage
  constructor: (@user, @text) ->
    @context =
      if @isAsciiMessage() then new EnglishContext else new JapaneseContext

  isAsciiMessage: () =>
    code = sh.run "echo #{shellescape [@text]}" +
                  " | nkf -g | xargs -I {} test {} = ASCII"
    return if code == 0 then true else false

  say: () =>
    sh.run "say -v #{shellescape [@context.getVoice()]}" +
           " #{shellescape [@getSayText()]}"

  outputLog: () =>
    console.log @getSayText(true)

  getSayText: (isRaw) =>
    if isRaw
      text = @text
    else
      text = @text
              .replace(/http[s]*:\/\/.*\s/g, '')
              .replace(/http[s]*:\/\/.*$/g, '')
              .replace(/^RT\s|\sRT\s/, "#{@context.getRetweet()}, ")
              .replace(/#/, "#{@context.getSharp()}, ")
    return "@#{@user}, #{text}"

class Context
  getVoice: () ->

  getRetweet: () ->

  getSharp: () ->

class JapaneseContext extends Context
  getVoice: () ->
    return process.env.SAY_HUBOT_JAPANESE_VOICE ? "Otoya"

  getRetweet: () ->
    return "リツイート"

  getSharp: () ->
    return "シャープ"

class EnglishContext extends Context
  getVoice: () ->
    return process.env.SAY_HUBOT_ENGLISH_VOICE ? "Alex"

  getRetweet: () ->
    return "retweet"

  getSharp: () ->
    return "sharp"

module.exports = (robot) ->
  robot.hear /^[^\s].*$/i, (msg) ->
    user = msg.envelope.message.user.name
    text = msg.envelope.message.text

    sm = new SayMessage user, text
    sm.outputLog()
    sm.say()
