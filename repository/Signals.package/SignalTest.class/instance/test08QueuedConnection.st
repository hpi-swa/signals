tests
test08QueuedConnection

	| queue result |
	queue := SharedQueue new.
	process := [queue next value. result := consumer value] forkAt: 60.
	
	consumer connect: producer signal: #valueChanged: toSelector: #value: queue: queue.
	producer value: #QueuedConnectionsAreCool.
	
	Processor yield. "Let the result be set."
	
	self assert: #QueuedConnectionsAreCool equals: result.