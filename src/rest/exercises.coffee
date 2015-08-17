
callback_function = require './callback_function'

module.exports =
  getExercises: (rest) ->
    (app, config) ->
      console.log rest
      app.get rest.path, (req,res) ->
        rest.dataCall(callback_function(res))
  getExerciseById: (rest) ->
    (app, config) ->
      app.get rest.path, (req,res) ->
        rest.dataCall(req.params.id, callback_function(res))
  ###
  putExerciseById: (rest) ->
    (app, config) ->
      app.put rest.path, (req,res) ->
        rest.dataCall(req.params.id, callback_function(res))
  ###
  getAllActiveExercises: (rest) ->
    (app, config) ->
      app.get rest.path, (req,res) ->
        rest.dataCall(callback_function(res))
  getDetailedExercise: (rest) ->
    (app, config) ->
      app.get rest.path, (req,res) ->
        rest.dataCall(req.params.id, callback_function(res))
