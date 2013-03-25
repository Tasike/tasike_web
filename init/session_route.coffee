# User xulin
# Date: 13-3-25
# Time: 下午2:18

SessionController = require('../controllers/session_controller')

# Session路由
#
module.exports = (app) ->
  sessionController = new SessionController app

  app.all('/signup', sessionController.signup)
  app.all('/login', sessionController.login)
  app.all('/logout', sessionController.requireLogin, sessionController.logout)