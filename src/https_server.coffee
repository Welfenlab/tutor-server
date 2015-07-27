
http = require 'http'
https = require 'https'

module.exports =
  start: (app, config) ->
    if config.ssl.enable != false
      privateKey  = fs.readFileSync config.ssl.keypath, 'utf8'
      certificate = fs.readFileSync config.ssl.certpath, 'utf8'

      credentials = key: privateKey, cert: certificate

      httpsServer = https.createServer credentials, app
      httpServer = http.createServer()
      httpServer.get '*', (req,res) ->
        res.redirect 'https://'+config.domainname+"/"+req.url
      httpServer.listen 80

      httpsServer.listen 443
      console.log 'server started at https://'+config.domainname
    else
      httpServer = http.createServer app
      if config.development
        httpServer.listen config.developmentPort
        console.log 'server started at http://'+config.domainname + ':' + config.developmentPort
      else
        httpServer.listen 80
        console.log 'server started at http://'+config.domainname
