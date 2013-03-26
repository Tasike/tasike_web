cluster = require 'cluster'
numCPUs = require('os').cpus().length
express = require 'express'
http = require 'http'

appConfig = require './init/app_config'
indexRoute = require './init/index_route'
authRoute = require './init/auth_route'
taskRoute = require './init/task_route'

app = express()

# config
appConfig app

# routes
indexRoute app
authRoute app
taskRoute app

logger = app.get('logger')
# handler
onlineHandler = (worker) ->
  logger.info 'Created worker: ' + worker.process.pid
  worker.lastCb = new Date().getTime() - 1000
  worker.on 'message', (msg) ->
    if msg.cmd is 'reportMem'
      worker.lastCb = new Date().getTime()
      if msg.memory.rss > 500 * 1024 * 1024
        logger.error 'Worker ' + msg.process.pid + ' using ' + msg.memory.rss + " B"
  return

exitHandler = (worker, code, signal) ->
  if worker.suicide is true
    logger.info 'Exit succeed'
  else
    logger.error 'Exit error'
    cluster.fork()
  return

disconnectHandler = (worker) ->
  delete cluster.workers[worker.process.pid]
  cluster.fork()
  return

checkAliveHandler = ->
  now = new Date().getTime()
  for pid, worker of cluster.workers
    if now - worker.lastCb > 60000
      logger.error 'Long running worker ' + pid + ' dead'
      worker.disconnect()
  return

reportMemHandler = ->
  process.send
    cmd: 'reportMem'
    memory: process.memoryUsage()
    pid: process.pid
  return

# server
if cluster.isMaster
  logger.info 'Run Mode: ' + process.env.NODE_ENV
  logger.info 'numCPUs ' + numCPUs

  cluster.on 'online', onlineHandler
  cluster.on 'exit', exitHandler
  cluster.on 'disconnect', disconnectHandler

  for i in [0...numCPUs]
    cluster.fork()

  setInterval checkAliveHandler, 1000
else
  http.createServer(app).listen app.get('port'), ->
    logger.info "Tasike server listening on port " + app.get 'port'
    return

  setInterval reportMemHandler, 1000






