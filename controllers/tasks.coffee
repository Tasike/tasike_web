# User xulin
# Date: 13-3-24
# Time: 下午5:08

module.exports = (app) ->
  Task = require('../models/task').Task

  return {
    # GET /tasks
    tasks: (req, res, next) ->
      res.send "Tasks"


  }