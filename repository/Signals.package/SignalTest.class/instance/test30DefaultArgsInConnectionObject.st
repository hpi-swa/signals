tests
test30DefaultArgsInConnectionObject

	consumer
		connect: producer
		signal: #newSignalProduced
		toSelector: #value:
		pattern: {#=. Morph new color: Color yellow}.

	producer produceSignal.

	self assert: Color yellow equals: consumer value color.