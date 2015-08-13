
callback_function = require './callback_function'

module.exports =
  getExercises: (rest) ->
    (app, config) ->
      app.get rest.path, (req,res) ->
        rest.dataCall(callback_function(res))
  getExerciseById: (rest) ->
    (app, config) ->
      app.get rest.path, (req,res) ->
        rest.dataCall(req.params.id, callback_function(res))
