# User xulin
# Date: 13-3-24
# Time: 下午3:04

mongoose = require('mongoose')
Schema = mongoose.Schema

TaskSchema = new Schema
  closed:
    type: Boolean
    'default': false
  desc:
    type: String
  endDate:
    type: Date
  idActions:
    type: Array
  idChecklists:
    type: Array
  idList:
    type: ObjectId
    required: true
  idMembers:
    type:Array
  idProject:
    type: ObjectId
    required: true
  lables:
    type: Array
  modifiedDate:
    type: Date
    required: true
  name:
    type: String
    required: true
  pos:
    type: Number
    required: true
  shortUrl:
    type: String
  startDate:
    type: Date
  url:
    type: String
    required: true


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