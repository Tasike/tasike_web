# User xulin
# Date: 13-3-24
# Time: 下午3:04

mongoose = require('mongoose')
Schema = mongoose.Schema

TaskSchema = new Schema(
  title: String
)

# Task模型类
#
# @note Task模型类包含对Task的所有读取和修改操作
#
# @extend mongoose.model("Task", TaskSchema)
#
# @property [String] title Task标题
#
class TaskModel extends mongoose.model("Task", TaskSchema)


module.exports =
  TaskSchema: TaskSchema
  TaskModel: TaskModel