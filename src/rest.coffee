
_ = require 'lodash'
callback_function = require './rest/callback_function'

module.exports = _.merge {
    get: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          rest.dataCall(callback_function(res, config))
    getByParam: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          rest.dataCall(req.params[rest.param], callback_function(res, config))
    getBySessionUID: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          rest.dataCall(req.session.uid, callback_function(res, config))
    postByBodyParam: (rest) ->
      (app, config) ->
        app.post rest.path, (req, res) ->
          rest.dataCall(req.body[rest.param], callback_function(res, config))
    putByBodyParam: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          rest.dataCall(req.body[rest.param], callback_function(res, config))
    putBySessionUIDAndBodyParam: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          rest.dataCall(req.session.uid, req.body[rest.param], callback_function(res, config))
    postBySessionUIDAndBodyParam: (rest) ->
      (app, config) ->
        app.post rest.path, (req, res) ->
          rest.dataCall(req.session.uid, req.body[rest.param], callback_function(res, config))
    deleteBySessionUID: (rest) ->
      (app, config) ->
        app.delete rest.path, (req,res) ->
          rest.dataCall(req.session.uid, callback_function(res, config))
  }
