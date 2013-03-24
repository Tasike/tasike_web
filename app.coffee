express = require 'express'
config = require './init/config'
index_routes = require './init/index_routes'
tasks_routes = require './init/tasks_routes'
http = require 'http'

app = express()

# config
config app

# routes
index_routes app
tasks_routes app

# server
http.createServer(app).listen app.get('port'), ->
  console.log "Tasike server listening on port " + app.get 'port'
  return




