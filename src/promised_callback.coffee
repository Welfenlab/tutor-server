

module.exports = (promise, res, config, errStatus) ->
  log = config.log
  promise.then (data) ->
    if data
      res.status(200).json(data)
    else
      res.status(204).end()
  promise.catch (error) ->
    log.error error.stack
    # TODO: perhaps we dont send errors in non dev mode?
    res.status(errStatus).send error
