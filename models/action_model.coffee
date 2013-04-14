# User xulin
# Date: 13-3-24
# Time: 下午2:52

mongoose = require('mongoose')
Schema = mongoose.Schema

ActionSchema = new Schema
  createdDate:
    type: Date
    required: true
  data:
    type: {}
  desc:
    type: String
  idCreator:
    type: ObjectId
    required: true
  name:
    type: String
    required: true


# Action模型类
#
# @note Action模型类包含对Action的所有读取和修改操作
#
# @extend mongoose.model("Action", ActionSchema)
#
class ActionModel extends mongoose.model("Action", ActionSchema)


module.exports =
  ActionSchema: ActionSchema
  ActionModel: ActionModel