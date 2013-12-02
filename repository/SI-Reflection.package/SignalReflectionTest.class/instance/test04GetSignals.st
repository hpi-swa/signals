testing
test04GetSignals

	self
		assert: 5 equals: SignalProducer signals size;
		assert: Object signals isEmpty.