tests
test29DefaultArgsInConnectionInteger

	consumer
		connect: producer
		signal: #newSignalProduced
		toSelector: #value:
		pattern: #(=5).

	producer produceSignal.

	self assert: 5 equals: consumer value.