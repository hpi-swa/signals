testing
test03IsSignal

	self
		should: (SignalProducer >> #valueChanged:) isSignal; "#emit"
		should: (SignalProducer >> #valueChanged2:) isSignal; "#emitAlways"
		deny: (SignalProducer >> #value:) isSignal.