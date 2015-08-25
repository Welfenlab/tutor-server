
express = require 'express'
tutor_config = require './config'

core_modules = require './modules'
restAPI = require './rest'
_ = require 'lodash'

httpsServer = require './https_server'

module.exports = (config) ->
  config = tutor_config config

  # core modules cannot be deactivated
  modules = config.modules.concat core_modules

  app = express()
  restCalls = []

  # sharejs server start
  sharejsServer = require('./sharejs_server')(config, app)

  return {
    createRestCall: (rest) ->
      restCalls.push rest

    start: ->
      console.log """start server with
\t#{modules.length} modules
\t#{restCalls.length} defined rest calls
"""
      modules.forEach (m) ->
        m app, config

      restCalls.forEach (r) ->
        restAPI[r.apiMethod](r) app, config

      httpsServer.start app, config
  }
