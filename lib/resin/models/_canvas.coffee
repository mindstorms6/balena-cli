_ = require('lodash')
Canvas = require('resin-platform-api')
Promise = require('bluebird')
config = require('../../config')
server = require('../server/server')
promisifiedServerRequest = Promise.promisify(server.request, server)

class CanvasRequestService extends Canvas(_, Promise)
	_request: (params) ->
		params.json = params.data
		params.gzip ?= true
		promisifiedServerRequest(params).spread (response, body) ->
			if 200 <= response.statusCode < 300
				return body
			throw new Error(body)

module.exports = new CanvasRequestService
	url: config.remoteUrl
	apiPrefix: config.apiPrefix
	withCredentials: true