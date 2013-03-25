# User xulin
# Date: 13-3-25
# Time: 上午11:45

# Session控制器类
#
# @note 在相应的route文件中将控制器函数绑定路由即可
#
class SessionController

  # 构造函数
  #
  # @param [object] app Tasike实例
  #
  constructor: (app) ->
    @app = app
    @logger = @app.get('logger')

  # 注册新用户
  #
  # @example 注册新用户
  #   GET/POST /signup
  #
  signup: (req, res, next) ->
    res.send "signup"

  # 用户登录
  #
  # @example 用户登录
  #   GET/POST /login
  #
  login: (req, res, next) ->
    res.send "signin"

  # 用户退出
  #
  # @example 用户退出
  #   GET/POST /logout
  #
  logout: (req, res, next) ->
    res.send "signin"

  # 用户认证Middleware
  #
  # @example 用户认证Middleware
  #   app.get('/', requireLogin, SessionController.logout)
  #
  requireLogin: (req, res, next) ->
    #return res.redirect '/login' unless req.session.loggedIn
    next()

module.exports = SessionController