# User xulin
# Date: 13-3-24
# Time: 下午2:52

mongoose = require('mongoose')
Schema = mongoose.Schema

ChecklistSchema = new Schema
  idCheckitems:
    type: Array
  idList:
    type: ObjectId
    required: true
  idProject:
    type: ObjectId
    required: true
  idTask:
    type: ObjectId
    required: true
  name:
    type: String
    required: true
  pos:
    type: Number
    required: true


# Checklist模型类
#
# @note Checklist模型类包含对Checklist的所有读取和修改操作
#
# @extend mongoose.model("Checklist", ChecklistSchema)
#
# @property [Array] idCheckitems Checklist包含的Checkitem ID列表
# @property [ObjectId] idList List ID
# @property [ObjectId] idProject Project ID
# @property [ObjectId] idTask Task ID
# @property [String] name 任务标题
# @property [Number] pos 上下的位置
#
class ChecklistModel extends mongoose.model("Checklist", ChecklistSchema)


module.exports =
  ChecklistSchema: ChecklistSchema
  ChecklistModel: ChecklistModel