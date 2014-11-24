_ = require('lodash')
DEVICES = require('./device-data.json')

exports.getDisplayName = (device) ->
	for key, value of DEVICES
		if _.indexOf(value.names, device) isnt -1
			return key
	return 'Unknown'

exports.getSupportedDevices = ->
	return _.map DEVICES, (device) ->
		return device.slug
