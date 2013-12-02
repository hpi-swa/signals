tests
test26BaseClassSignals

	| producerEx |
	producerEx := SignalProducerEx new.
	
	consumer connect: producerEx signal: #valueChanged: toSelector: #value:.
	
	self assert: nil equals: consumer value.
	producerEx value: #foobar.
	self assert: #foobar equals: consumer value.