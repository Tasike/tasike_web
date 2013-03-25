# User xulin
# Date: 13-3-25
# Time: 下午2:18

SessionController = require('../controllers/session_controller')

# Session路由
#
module.exports = (app) ->
  sessionController = new SessionController app

  app.get('/signup', sessionController.signup)
  app.get('/login', sessionController.login)
  app.get('/logout', sessionController.requireLogin, sessionController.logout)