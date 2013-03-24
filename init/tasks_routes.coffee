# User xulin
# Date: 13-3-24
# Time: 下午5:21

module.exports = (app) ->
  TaskController = require('../controllers/tasks').getController app

  app.get('/tasks', TaskController.tasks)
