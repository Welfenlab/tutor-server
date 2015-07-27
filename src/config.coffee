_ = require "lodash"

default_conf =
  development: true
  domainname: "localhost"
  modules: []
  ssl:
    enable : true
  app:
    path : "./app"
  database:
    type: "dump" # dumps changes
  log:
    path: "./tutor.log"
    level: "warn" # possible values: ?? debug, info, warn, error ??

global_config = default_conf

module.exports = (conf) ->
  if conf?
    global_config = _.defaults conf, default_conf
  return global_config
