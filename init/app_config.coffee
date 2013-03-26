# User xulin
# Date: 13-3-24
# Time: 下午5:21

express = require 'express'
less = require 'less-middleware'
log4js = require 'log4js'
RedisSessionStore = require('connect-redis')(express)

# Tasike配置
#
module.exports = (app) ->
  app.configure ->
    app.set 'view engine', 'jade'
    app.use express.favicon()
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()
    app.use app.router

  app.configure 'development', ->
    config = require "../config/development_config"

    app.set 'version', require("#{config.root_dir}/package.json").version
    app.set 'port', config.port
    app.set 'views', "#{config.root_dir}/views"

    log4js.configure config.log
    logger = log4js.getLogger 'tasike'
    app.use log4js.connectLogger logger

    redisSessionStore = new RedisSessionStore config.redis
    app.use express.session
      secret: config.salt
      cookie:
        path: '/'
        httpOnly: true
        maxAge: 60 * 60 * 24 * 7
      store: redisSessionStore

    app.use less(src: "#{config.root_dir}/public")
    app.use express["static"]("#{config.root_dir}/public")
    app.use express.errorHandler
      dumpException: true
      showStack: true

    app.set 'logger', logger
    app.set 'config', config

  app.configure 'production', ->
    config = require "../config/production_config"

    app.set 'version', require("#{config.root_dir}/package.json").version
    app.set 'port', config.port
    app.set 'views', "#{config.root_dir}/views"

    log4js.configure config.log
    logger = log4js.getLogger 'tasike'
    app.use log4js.connectLogger logger

    redisSessionStore = new RedisSessionStore config.redis
    app.use express.session
      secret: config.salt
      cookie:
        path: '/'
        httpOnly: true
        maxAge: 60 * 60 * 24 * 7
      store: redisSessionStore

    app.use less(src: "#{config.root_dir}/public")
    app.use express["static"]("#{config.root_dir}/public")
    app.use express.errorHandler()

    app.set 'logger', logger
    app.set 'config', config

