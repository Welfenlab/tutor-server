
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

  bodyParser = require 'body-parser'
  app.use bodyParser.json(limit: '5mb')
  app.use bodyParser.urlencoded extended: true

  # sharejs server start
  #sharejsServer = require('./sharejs_server')(config, app)

  return {
    createRestCall: (rest) ->
      rest.errStatus = rest.errStatus || 500
      restCalls.push rest

    start: ->
      console.log """start server with
\t#{modules.length} modules
\t#{restCalls.length} defined rest calls
"""
      server = httpsServer.start app, config

      modules.forEach (m) ->
        m app, config

      restCalls.forEach (r) ->
        if typeof restAPI[r.apiMethod] != "function"
          console.error "undefined rest API Method #{r.apiMethod}"
        restAPI[r.apiMethod](r) app, config

      server
  }
