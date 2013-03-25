# User xulin
# Date: 13-3-24
# Time: 下午5:21

module.exports = (app) ->
  IndexController = require('../controllers/index') app

  app.get('/', IndexController.index)
