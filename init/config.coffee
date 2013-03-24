# User xulin
# Date: 13-3-24
# Time: 下午5:21

express = require 'express'
less = require 'less-middleware'

ROOT_DIR = "#{__dirname}/.."
SECRET = "TASIKE"

module.exports = (app) ->
  app.configure ->
    app.set 'version', require("#{ROOT_DIR}/package.json").version
    app.set 'port', process.env.PORT or 8888
    app.set 'views', "#{ROOT_DIR}/views"
    app.set 'view engine', 'jade'
    app.use express.favicon()
    app.use express.logger('dev')
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()
    app.use express.session(secret: SECRET)
    app.use less(src: "#{ROOT_DIR}/public")
    app.use express["static"]("#{ROOT_DIR}/public")
    app.use app.router

  app.configure 'development', ->
    app.use express.errorHandler(dumpException: true, showStack: true)

  app.configure 'production', ->
    app.use express.errorHandler()

