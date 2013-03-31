# User xulin
# Date: 13-3-24
# Time: 下午5:21

IndexController = require('../controllers/index_controller')

# Index路由
#
module.exports = (app) ->
  indexController = new IndexController app

  app.get '/', indexController.index
