# User xulin
# Date: 13-3-25
# Time: 上午11:45

ApplicationController = require './application_controller'

# Auth控制器类
#
# @note 在相应的route文件中将控制器函数绑定路由即可
#
class AuthController extends ApplicationController

  # 注册新用户
  #
  # @example 注册新用户
  #   GET/POST /signup
  #
  signup: (req, res, next) =>
    res.send "signup"

  # 用户登录
  #
  # @example 用户登录
  #   GET/POST /login
  #
  login: (req, res, next) =>
    @logger.info 'dasdasdasd'
    res.send "signin"

  # 用户退出
  #
  # @example 用户退出
  #   GET/POST /logout
  #
  logout: (req, res, next) =>
    res.send "signin"

  # 用户认证Middleware
  #
  # @example 用户认证Middleware
  #   app.get('/', requireLogin, AuthController.logout)
  #
  requireLogin: (req, res, next) =>
    #return res.redirect '/login' unless req.session.loggedIn
    next()

module.exports = AuthController