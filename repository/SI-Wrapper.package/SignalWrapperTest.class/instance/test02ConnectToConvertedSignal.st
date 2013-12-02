tests
test02ConnectToConvertedSignal

	| producer consumer |
	producer := SignalProducerByWrapping new.
	consumer := SignalConsumer new.
		
	consumer connect: producer signal: #value: toSelector: #value:.
	producer value: #foobar.
	
	self
		assert: #foobar
		equals: consumer value.