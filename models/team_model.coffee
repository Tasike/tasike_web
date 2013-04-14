# User xulin
# Date: 13-3-24
# Time: 下午2:51

mongoose = require('mongoose')
Schema = mongoose.Schema

TeamSchema = new Schema
  desc:
    type: String
  idCreator:
    type: ObjectId
    required: true
  idMembers:
    type: Array
  idProjects:
    type: Array
  name:
    type: String
    required: true
  visibility:
    type: String
    required: true
    'default': 'private'


# Team模型类
#
# @note Team模型类包含对Team的所有读取和修改操作
#
# @extend mongoose.model("Team", TeamSchema)
#
class TeamModel extends mongoose.model("Team", TeamSchema)


module.exports =
  TeamSchema: TeamSchema
  TeamModel: TeamModel