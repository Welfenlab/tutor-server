

module.exports = (res, config) ->
  log = config.log
  (err, data) ->
    if err
      log.error err
      res.status(500).send err
    else if data
      res.status(200).json(data)
    else
      res.status(204).end()
