

module.exports = (res) ->
  (err, data) ->
    if err
      console.error err
      res.status(500).send err
    else if data
      res.status(200).json(data)
    else
      res.status(204).end()
