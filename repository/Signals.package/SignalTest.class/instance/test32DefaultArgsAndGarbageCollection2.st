tests
test32DefaultArgsAndGarbageCollection2

	| weakArray signalConsumer signalProducer |
	signalConsumer := SignalConsumer new.
	signalProducer := SignalProducer new.
	
	weakArray := WeakArray
		with: signalConsumer
		with: signalProducer.
	
	self deny: (SignalConnectionsRepository instance includesKey: signalProducer).

	signalConsumer
		connect: signalProducer
		signal: #newSignalProduced
		toSelector: #value:
		pattern: {#=. signalProducer}.

	self
		assert: (SignalConnectionsRepository instance includesKey: signalProducer);
		assert: ({signalConsumer. signalProducer} hasEqualElements: weakArray).
	
	signalConsumer := nil.
	signalProducer := nil.

	SignalConnectionsRepository instance finalizeLater.
	Smalltalk garbageCollect.
	Processor yield. "Let weak array finalization process run."

	self
		deny: (SignalConnectionsRepository instance includesKey: signalProducer);
		assert: ({nil. nil} hasEqualElements: weakArray copy).