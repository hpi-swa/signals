tests
test28DefaultArgsInConnectionSymbol

	consumer
		connect: producer
		signal: #newSignalProduced
		toSelector: #value:
		pattern: #(=foobar).

	producer produceSignal.

	self assert: #foobar equals: consumer value.