
_ = require 'lodash'
promisedCallback = require './promised_callback'

module.exports = _.merge {
    get: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          promisedCallback rest.dataCall(), res, config, rest.errStatus
    getByParam: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.params[rest.param]), res, config, rest.errStatus
    getBySessionUID: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.session.uid), res, config, rest.errStatus
    getBySessionUIDAndParam: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.session.uid, req.params[rest.param]), res, config, rest.errStatus
    postByBodyParam: (rest) ->
      (app, config) ->
        app.post rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.body[rest.param]), res, config, rest.errStatus
    putByBodyParam: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.body[rest.param]), res, config, rest.errStatus
    putBySessionUIDAndParam: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.session.uid, req.body[rest.param]), res, config, rest.errStatus
    putBySessionUIDAndParams: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          args = [req.session.uid].concat _.map rest.params, (p) -> req.body[p]
          promisedCallback rest.dataCall.apply(null, args), res, config, rest.errStatus
    postBySessionUIDAndParam: (rest) ->
      (app, config) ->
        app.post rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.session.uid, req.body[rest.param]), res, config, rest.errStatus
    deleteBySessionUID: (rest) ->
      (app, config) ->
        app.delete rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.session.uid), res, config, rest.errStatus
  }
