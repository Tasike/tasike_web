# User xulin
# Date: 13-3-25
# Time: 下午2:18

AuthController = require('../controllers/Auth_controller')

# Session路由
#
module.exports = (app) ->
  authController = new AuthController app

  app.all '/signup', authController.signup
  app.all '/login', authController.login
  app.all '/logout', authController.requireLogin, authController.logout