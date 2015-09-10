
_ = require 'lodash'
promisedCallback = require './promised_callback'

module.exports = _.merge {
    get: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          promisedCallback rest.dataCall(), res, config
    getByParam: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.params[rest.param]), res, config
    getBySessionUID: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.session.uid), res, config
    postByBodyParam: (rest) ->
      (app, config) ->
        app.post rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.body[rest.param]), res, config
    putByBodyParam: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.body[rest.param]), res, config
    putBySessionUIDAndParam: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.session.uid, req.body[rest.param]), res, config
    postBySessionUIDAndParam: (rest) ->
      (app, config) ->
        app.post rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.session.uid, req.body[rest.param]), res, config
    deleteBySessionUID: (rest) ->
      (app, config) ->
        app.delete rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.session.uid), res, config
  }
