
_ = require 'lodash'
promisedCallback = require './promised_callback'

module.exports = _.merge {
    get: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          console.log req.session
          promisedCallback rest.dataCall(), res, config
    getByParam: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.params[rest.param]), res, config
    getBySessionPseudo: (rest) ->
      (app, config) ->
        app.get rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.session.pseudonym), res, config
    postByBodyParam: (rest) ->
      (app, config) ->
        app.post rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.body[rest.param]), res, config
    putByBodyParam: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.body[rest.param]), res, config
    putBySessionPseudoAndParam: (rest) ->
      (app, config) ->
        app.put rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.session.pseudonym, req.body[rest.param]), res, config
    postBySessionPseudoAndParam: (rest) ->
      (app, config) ->
        app.post rest.path, (req, res) ->
          promisedCallback rest.dataCall(req.session.pseudonym, req.body[rest.param]), res, config
    deleteBySessionPseudo: (rest) ->
      (app, config) ->
        app.delete rest.path, (req,res) ->
          promisedCallback rest.dataCall(req.session.pseudonym), res, config
  }
