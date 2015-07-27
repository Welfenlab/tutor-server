

module.exports = (res) ->
  (err, data) ->
    if err
      console.error err
    else
      res.status(200).json(data)
