# User xulin
# Date: 13-3-31
# Time: 下午3:58

# 所用控制器类的父类
#
class ApplicationController

  # 构造函数
  #
  # @param [object] app Tasike实例
  #
  constructor: (app) ->
    @app = app
    @logger = @app.get('logger')

module.exports = ApplicationController