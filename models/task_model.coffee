# User xulin
# Date: 13-3-24
# Time: 下午3:04

mongoose = require('mongoose')
Schema = mongoose.Schema

TaskSchema = new Schema
  name:
    type: String
    required: true
  url:
    type: String
    required: true
  shortURL:
    type: String
  startDate:
    type: Date
  endDate:
    type: Date
  desc:
    type: String


# Task模型类
#
# @note Task模型类包含对Task的所有读取和修改操作
#
# @extend mongoose.model("Task", TaskSchema)
#
# @property [String] name 任务标题
# @property [String] url 任务唯一的URL
# @property [String] shortURL 任务唯一的短URL，需要时再生成
# @property [Date] startDate 任务开始时间
# @property [Date] endDate 任务到期时间
# @property [String] desc 任务描述
#
class TaskModel extends mongoose.model("Task", TaskSchema)


module.exports =
  TaskSchema: TaskSchema
  TaskModel: TaskModel