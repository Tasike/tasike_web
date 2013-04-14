# User xulin
# Date: 13-3-24
# Time: 下午2:51

mongoose = require('mongoose')
Schema = mongoose.Schema

UserSchema = new Schema
  confirmed:
    type: Boolean
    'default': false
  desc:
    type: String
  displayName:
      type: String
  email:
    type: String
    required: true
    unique: true
  idAvatar:
    type: ObjectId
  idNotifications:
    type: ObjectId
  idProjectsPinned:
    type: Array
  idProjects:
    type: Array
  idTeams:
    type: Array
  idTeamsInvited:
    type: Array
  userType:
    type: String
    required: true
    'default': 'member'
  name:
    type: String
    required: true
    unique: true
  newEmail:
    type: String
  url:
    type: String
    required: true
    unique: true




# User模型类
#
# @note User模型类包含对User的所有读取和修改操作
#
# @extend mongoose.model("User", UserSchema)
#
class UserModel extends mongoose.model("User", UserSchema)


module.exports =
  UserSchema: UserSchema
  UserModel: UserModel