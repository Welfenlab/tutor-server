
express = require 'express'

module.exports = (app, config) ->
  app.use express.static config.app.path,
    dotfiles: if config.development then 'allow' else 'deny'
