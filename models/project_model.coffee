# User xulin
# Date: 13-3-24
# Time: 下午2:51

mongoose = require('mongoose')
Schema = mongoose.Schema

ProjectSchema = new Schema
  closed:
    type: Boolean
    'default': false
  desc:
    type: String
  idActions:
    type: Array
  idAdmins:
    type: Array
  idLists:
    type: Array
  idMembers:
    type: Array
  idTeam:
    type: ObjectId
    required: true
  labelNames:
    type: {}
    'default':
      red: ''
      orange: ''
      yellow: ''
      green: ''
      blue: ''
      purple: ''
  name:
    type: String
    required: true
  pinned:
    type: Boolean
    'default': true
  shortUrl:
    type: String
  url:
    type: String
    required: true
  visibility:
    type: String
    required: true
    'default': 'team'


# Project模型类
#
# @note Project模型类包含对Project的所有读取和修改操作
#
# @extend mongoose.model("Project", ProjectSchema)
#
# @property [String] visibility 值为：private，team，public，确定了可见范围。只有属于Project的人才可编辑
#
class ProjectModel extends mongoose.model("Project", ProjectSchema)


module.exports =
  ProjectSchema: ProjectSchema
  ProjectModel: ProjectModel