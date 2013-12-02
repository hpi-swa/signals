tests
test27BaseClassSignalsEx

	| producerEx |
	producerEx := SignalProducerEx new.
	
	consumer connect: producerEx signal: #valueChanged: toSelector: #value:.
	
	self assert: nil equals: consumer value.
	producerEx valueEx: #foobar.
	self assert: #foobar equals: consumer value.