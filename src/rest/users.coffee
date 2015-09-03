
callback_function = require './callback_function'

module.exports =
  getUserPseudonym: (rest) ->
    (app, config) ->
      app.get rest.path, (req,res) ->
        rest.dataCall(req.session.uid, callback_function(res))
