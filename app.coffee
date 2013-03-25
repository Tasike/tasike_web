cluster = require 'cluster'
numCPUs = require('os').cpus().length
express = require 'express'
http = require 'http'

config = require './init/config'
indexRoute = require './init/index_route'
sessionRoute = require './init/session_route'
taskRoute = require './init/task_route'

app = express()

# config
config app

# routes
indexRoute app
sessionRoute app
taskRoute app

# handler
onlineHandler = (worker) ->
  console.log 'Created worker: ' + worker.process.pid
  worker.lastCb = new Date().getTime() - 1000
  worker.on 'message', (msg) ->
    if msg.cmd is 'reportMem'
      worker.lastCb = new Date().getTime()
      if msg.memory.rss > 500 * 1024 * 1024
        console.log 'Worker ' + msg.process.pid + ' using ' + msg.memory.rss + " B"
  return

exitHandler = (worker, code, signal) ->
  if worker.suicide is true
    console.log 'Exit succeed'
  else
    console.log 'Exit error'
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
      console.log 'Long running worker ' + pid + ' dead'
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
  console.log 'numCPUs ' + numCPUs

  cluster.on 'online', onlineHandler
  cluster.on 'exit', exitHandler
  cluster.on 'disconnect', disconnectHandler

  for i in [0...numCPUs]
    cluster.fork()

  setInterval checkAliveHandler, 1000
else
  http.createServer(app).listen app.get('port'), ->
    console.log "Tasike server listening on port " + app.get 'port'
    return

  setInterval reportMemHandler, 1000






