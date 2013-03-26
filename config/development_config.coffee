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
    db: "0"
    ttl: 60 * 60 * 24 * 8

_ = require "underscore"


module.exports = _.extend developmentConfig, config
