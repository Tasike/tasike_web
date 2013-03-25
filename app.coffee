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

# server
http.createServer(app).listen app.get('port'), ->
  console.log "Tasike server listening on port " + app.get 'port'
  return




