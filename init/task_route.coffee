# User xulin
# Date: 13-3-24
# Time: 下午5:21

TaskController = require('../controllers/task_controller')

# Task路由
#
module.exports = (app) ->
  taskController = new TaskController app

  app.get('/tasks', taskController.tasks)
