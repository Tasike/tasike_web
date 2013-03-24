# User xulin
# Date: 13-3-24
# Time: 下午3:04

mongoose = require('mongoose')
Schema = mongoose.Schema

TaskSchema = new Schema(
  name: String
)

Task = mongoose.model("Task", TaskSchema)

module.exports =
  TaskSchema: TaskSchema
  Task: Task