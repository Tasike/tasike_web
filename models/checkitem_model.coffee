# User xulin
# Date: 13-3-24
# Time: 下午2:52

mongoose = require('mongoose')
Schema = mongoose.Schema

CheckitemSchema = new Schema
  idChecklist:
    type: ObjectId
    required: true
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
  state:
    type: String
    required: true
    'default': 'incomplete'


# Checkitem模型类
#
# @note Checkitem模型类包含对Checkitem的所有读取和修改操作
#
# @extend mongoose.model("Checkitem", ChecklistSchema)
#
# @property [ObjectId] idChecklist Checklist ID
# @property [ObjectId] idList List ID
# @property [ObjectId] idProject Project ID
# @property [ObjectId] idTask Task ID
# @property [String] name 任务标题
# @property [Number] pos 上下的位置
# @property [String] state 任务状态，incomplete或complete
#
class CheckitemModel extends mongoose.model("Checkitem", CheckitemSchema)


module.exports =
  CheckitemSchema: CheckitemSchema
  CheckitemModel: CheckitemModel