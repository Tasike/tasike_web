# User xulin
# Date: 13-3-24
# Time: 下午5:08

TaskModel = require('../models/task_model').TaskModel

# Task控制器类
#
# @note 在相应的route文件中将控制器函数绑定路由即可
#
class TaskController

  # 构造函数
  #
  # @param [object] app Tasike实例
  #
  constructor: (app) ->
    @app = app
    @logger = @app.get('logger')

  # 获取所有Task
  #
  # @example 获取所有Task
  #   GET /tasks
  #
  tasks: (req, res, next) ->
    res.send "Tasks"

module.exports = TaskController