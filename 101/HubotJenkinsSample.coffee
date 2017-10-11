module.exports = (robot) ->
  robot.respond /j(?:enkins)? hoge(, (.+))?/i, (msg) ->

    # Jenkinsジョブのパラメータを設定する
    # Jenkinsで設定したプロパティ名と一致させる
    params = msg.match[2].replace(/ /g, "").split(",")
    parameter = "HOGE=#{params[0]}"
    job = {*ジョブ名*}

    # JenkinsジョブのURL
    path = "{*Jenkinsのドメイン*}/job/#{job}/buildWithParameters?#{parameter}"

    req = msg.http(path)

    # リクエストヘッダを設定する
    # 認証方法はベーシック認証を使用している
    auth = new Buffer("username:password").toString("base64")
    req.headers Authorization: "Basic #{auth}"

    req.post() (err, res, body) ->
      if err
        msg.send "Jenkins says: #{err}"
      else if 200 <= res.statusCode < 400
        msg.send "Build started for #{job}"
      else if res.statusCode is 404
        msg.send "Build not found, double check that it exists and is spelt correctly."
      else
        msg.send "Jenkins says: Status #{res.statusCode}"
