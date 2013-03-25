# User xulin
# Date: 13-3-24
# Time: 下午5:08

# Index控制器类
#
# @note How to subclass an animal
#
class IndexController

  # 构造函数
  #
  # @param [object] app Tasike实例
  #
  constructor: (app) ->
    @app = app
    @logger = @app.get('logger')

  # 主页
  #
  # @example 主页
  #   GET /
  #
  index: (req, res, next) ->
    res.render 'index', title: 'Express'

module.exports = IndexController