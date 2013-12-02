tests
test25WeakRepositoryFinalization

	SignalConnectionsRepository reset.

	SignalConsumer new
		connect: SignalProducer new
		signal: #valueChanged:
		toSelector: #valueConsumed.
	
	"Let's finalize."
	Smalltalk garbageCollect.
	Processor yield.

	self assert: SignalConnectionsRepository instance isEmpty.