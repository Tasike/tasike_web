config = require "./config"

developmentConfig =
  log:
    appenders: [
      "type": "console"
      "category": "tasike"
      "layout":
        "type": "pattern"
        "pattern": "[%d{ISO8601}] [%x{pid}] [%p] [%m]"
        "tokens":
          "pid": ->
            process.pid
    ]
    levels:
      "tasike": "DEBUG"
  redis:
    host: "127.0.0.1"
    port: "6379"
    db: "1"
    no_ready_check: true
    ttl: 60 * 60 * 24 * 8
  mongodb:
    # "mongodb://#{user}:#{pass}@#{host}:#{port}/#{db}"
    #
    uri: "mongodb://127.0.0.1:27017/tasike"


_ = require "underscore"


module.exports = _.extend developmentConfig, config
