config = require "./config"

productionConfig =
  log:
    appenders: [
      "type": "dateFile"
      "filename": "#{config.root_dir}/logs/tasike.log"
      "pattern": ".yyyy-MM-dd"
      "backups": 7
      "category": "tasike"
      "layout":
        "type": "pattern"
        "pattern": "[%d{ISO8601}] [%x{pid}] [%p] [%m]"
        "tokens":
          "pid": ->
            process.pid
    ]
    levels:
      "tasike": "INFO"
    replaceConsole: true
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

module.exports = _.extend productionConfig, config