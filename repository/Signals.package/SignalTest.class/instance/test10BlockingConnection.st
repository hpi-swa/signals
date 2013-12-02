tests
test10BlockingConnection

	| result |
	consumer
		connect: producer
		signal: #valueChanged:
		toSelector: #value:
		queue: WorldState deferredUIMessages
		blocking: true.
		
	process := [producer value: #QueuedConnectionsAreCool. result := 'blubb'] forkAt: 60.
	Processor yield.
	
	self assert: nil equals: result.
	
	World doOneCycle. "Deliver the signal."
	Processor yield. "Let the result be set."
	
	self assert: 'blubb' equals: result.