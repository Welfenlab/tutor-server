module.exports = (config, app) ->
  {    
    spine:
      config: config.sharejs

      // TODO
      operationAllowed: (dat) ->
        return {
          allowed: true
          terminateSession: true
        }

      // TODO
      log: (str) ->
        console.log('(share-ace) ' + str);
  }
