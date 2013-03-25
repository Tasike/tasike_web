# User xulin
# Date: 13-3-24
# Time: 下午5:21

express = require 'express'
less = require 'less-middleware'
log4js = require 'log4js'

ROOT_DIR = "#{__dirname}/.."
SECRET = "TASIKE"

# Tasike配置
#
module.exports = (app) ->
  app.configure ->
    app.set 'version', require("#{ROOT_DIR}/package.json").version
    app.set 'port', process.env.PORT or 8888
    app.set 'views', "#{ROOT_DIR}/views"
    app.set 'view engine', 'jade'
    app.set 'logger', log4js.getLogger()

    app.use express.favicon()
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()
    app.use express.session(secret: SECRET)
    app.use less(src: "#{ROOT_DIR}/public")
    app.use express["static"]("#{ROOT_DIR}/public")
    app.use app.router

  app.configure 'development', ->
    logConfig =
      appenders: [
        {
          "type": "console"
          "category": "tasike"
          "layout":
            "type": "pattern"
            "pattern": "[%d{ISO8601}] [%x{pid}] [%p] [%m]"
            "tokens":
              "pid": ->
                process.pid
        }
      ]
      levels:
        "tasike": "DEBUG"

    log4js.configure logConfig
    logger = log4js.getLogger('tasike')

    app.set 'logger', logger
    app.use express.errorHandler(dumpException: true, showStack: true)

  app.configure 'production', ->
    logConfig =
      appenders: [
        {
        "type": "dateFile"
        "filename": "#{ROOT_DIR}/logs/tasike.log"
        "pattern": ".yyyy-MM-dd"
        "backups": 7
        "category": "tasike"
        "layout":
          "type": "pattern"
          "pattern": "[%d{ISO8601}] [%x{pid}] [%p] [%m]"
          "tokens":
            "pid": ->
              process.pid
        }
      ]
      levels:
        "tasike": "INFO"
      replaceConsole: true

    log4js.configure logConfig
    logger = log4js.getLogger('tasike')

    app.set 'logger', logger
    app.use express.errorHandler()

