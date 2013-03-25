# User xulin
# Date: 13-3-24
# Time: 下午5:08

module.exports = (app) ->
  return {
    # GET /
    index: (req, res, next) ->
      res.render 'index', title: 'Express'
  }