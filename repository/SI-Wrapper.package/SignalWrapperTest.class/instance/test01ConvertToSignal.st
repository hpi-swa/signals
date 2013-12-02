tests
test01ConvertToSignal

	| producer consumer |
	producer := SignalProducerByWrapping new.
	consumer := SignalConsumer new.

	self
		assert: 0
		equals: SignalProducerByWrapping wrapperCount.
		
	consumer connect: producer signal: #value: toSelector: #value:.
	
	self
		assert: 1
		equals: SignalProducerByWrapping wrapperCount.
		
	consumer connect: producer signal: #value: toSelector: #value:.
	
	self
		assert: 1
		equals: SignalProducerByWrapping wrapperCount.