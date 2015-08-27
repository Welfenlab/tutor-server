
callback_function = require './callback_function'

module.exports =
  getGroupForUser: (rest) ->
    (app, config) ->
      app.get rest.path, (req,res) ->
        rest.dataCall(req.params.id, callback_function(res))
  leaveGroup: (rest) ->
    (app, config) ->
      app.get rest.path, (req,res) ->
        rest.dataCall(req.params.id, callback_function(res))
  createGroup: (rest) ->
    (app, config) ->
      app.get rest.path, (req,res) ->
        rest.dataCall(req.params.ids, callback_function(res))
