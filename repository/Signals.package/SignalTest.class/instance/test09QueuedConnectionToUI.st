tests
test09QueuedConnectionToUI

	consumer
		connect: producer
		signal: #valueChanged:
		toSelector: #value:
		queue: WorldState deferredUIMessages.
		
	producer value: #QueuedConnectionsAreCool.
	
	self assert: nil equals: consumer value.
	World doOneCycle. "Let the result be set. Do it manually here because we ARE already in the UI process."
	self assert: #QueuedConnectionsAreCool equals: consumer value.