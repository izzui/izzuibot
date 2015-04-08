# Starts a build on TeamCity.
#
# You need to set the following variables:
# HUBOT_TEAMCITY_USERNAME =
# HUBOT_TEAMCITY_PASSWORD =
# HUBOT_TEAMCITY_HOSTNAME =
#
# start build buildId -- Starts TeamCiyt build using buildId

module.exports = (robot) ->
  robot.respond /start (.*)/i, (msg) ->
  username = 'izzuibot'
  password = 'izzu1b0tP4ssword!'
  hostname = 'http://ci.izzui.com:8111'
  buildName = msg.match[1]

  msg.http("http://#{hostname}/httpAuth/action.html?add2Queue=#{buildName}")
  .headers(Authorization: "Basic #{new Buffer("#{username}:#{password}")
    .toString("base64")}",
      Accept: "application/json"
    ).get() (err, res, body) ->
    if err
      msg.send "Team city says: #{err}"
