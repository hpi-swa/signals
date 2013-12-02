tests
test19UseSenderAsArgument
	
	consumer connect: producer signal: #newSignalProduced toSelector: #value: pattern: #(0).
	producer produceSignal.
	
	self assert: producer equals: consumer value.