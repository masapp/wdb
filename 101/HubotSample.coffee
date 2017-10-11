module.exports = (robot) ->
  # respondは@{*hubotName*}でHubotに対して
  # メンション付きで発言した場合に実行される
  # 反応させたい単語は正規表現で指定する
  robot.respond /ほげ/i, (msg) ->
    msg.send "respond ほげ"

  # hearはHubotにメンションを付けなくても
  # その単語が発言されたら実行される
  # 反応させたい単語は正規表現で指定する
  robot.hear /ふが/i, (msg) ->
    msg.send "hear ふが"
