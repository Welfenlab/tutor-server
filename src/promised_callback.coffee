

module.exports = (promise, res, config) ->
  log = config.log
  promise.then (data) ->
    if data
      res.status(200).json(data)
    else
      res.status(204).end()
  promise.catch (error) ->
    log.error error
    # TODO: perhaps we dont send errors in non dev mode?
    res.status(500).send error
