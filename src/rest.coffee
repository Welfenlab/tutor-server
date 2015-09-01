
_ = require 'lodash'

module.exports = _.merge {},
  (require './rest/exercises'),
  (require './rest/groups'),
  (require './rest/users')
 
