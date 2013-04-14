# User xulin
# Date: 13-3-24
# Time: 下午2:52

mongoose = require('mongoose')
Schema = mongoose.Schema

ListSchema = new Schema
  closed:
    type: Boolean
    'default': false
  idProject:
    type: ObjectId
    required: true
  idTasks:
    type: Array
  name:
    type: String
    required: true
  pos:
    type: Number
    required: true


# List模型类
#
# @note List模型类包含对List的所有读取和修改操作
#
# @extend mongoose.model("List", ListSchema)
#
class ListModel extends mongoose.model("List", ListSchema)


module.exports =
  ListSchema: ListSchema
  ListModel: ListModel