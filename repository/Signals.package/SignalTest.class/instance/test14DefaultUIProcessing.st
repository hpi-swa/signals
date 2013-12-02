tests
test14DefaultUIProcessing
	"Check whether default connections out of the ui process will only be processed in the ui process."
	
	self assert: UIManager default uiProcess equals: Processor activeProcess.
	
	consumer
		connect: producer
		signal: #valueChanged:
		toSelector: #value:.
		
	process := [producer value: #QueuedConnectionsAreCool] forkAt: 60.
	Processor yield.
	
	self assert: nil equals: consumer value.
	
	World doOneCycle. "Deliver the signal."
	
	self assert: #QueuedConnectionsAreCool equals: consumer value.