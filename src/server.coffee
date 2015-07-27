
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
  console.log "creating server", modules

  app = express()

  return {
    createRestCall: (rest) ->
      restAPI[rest.apiMethod](rest) app, config

    start: ->
      modules.forEach (m) ->
        m app, config

      httpsServer.start app, config
  }
