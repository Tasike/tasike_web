# User xulin
# Date: 13-3-24
# Time: 下午5:08

ApplicationController = require './application_controller'

# Index控制器类
#
# @note How to subclass an animal
#
class IndexController extends ApplicationController

  # 主页
  #
  # @example 主页
  #   GET /
  #
  index: (req, res, next) =>
    res.render 'index', title: 'Express'

module.exports = IndexController