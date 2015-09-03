
_ = require 'lodash'
callback_function = require './rest/callback_function'

module.exports = _.merge {
    get: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          rest.dataCall(callback_function(res))
    getByParam: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          rest.dataCall(req.params[rest.param], callback_function(res))
    getBySessionUID: (rest) ->
      (app, config) ->
        console.log "defining get ", rest.path
        app.get rest.path, (req,res) ->
          console.log req.session
          rest.dataCall(req.session.uid, callback_function(res))
    postByBodyParam: (rest) ->
      (app, config) ->
        app.post rest.path, (req, res) ->
          rest.dataCall(req.body[rest.param], callback_function(res))
    putByBodyParam: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          rest.dataCall(req.body[rest.param], callback_function(res))
    putBySessionUIDAndBodyParam: (rest) ->
      (app, config) ->
        console.log "defining ", rest.path
        app.put rest.path, (req, res) ->
          console.log req.session.uid, req.body
          rest.dataCall(req.session.uid, req.body[rest.param], callback_function(res))
  }
