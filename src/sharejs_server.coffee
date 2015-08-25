module.exports = (config, app) ->
  spine =
    config: config.sharejs
    operationAllowed: (dat) -> # TODO
      return {
        allowed: true
        terminateSession: true
      }
    log: (str) -> # TODO
      console.log('(share-ace) ' + str)

  return (require('@tutor/share-ace-rethinkdb'))(app, spine)
