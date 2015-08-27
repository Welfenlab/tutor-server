

module.exports = (res) ->
  (err, data) ->
    if err
      console.error err
      res.status(500).send err
    else
      res.status(200).json(data)
