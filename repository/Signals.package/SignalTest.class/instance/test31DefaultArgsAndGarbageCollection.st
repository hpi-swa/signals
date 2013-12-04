tests
test31DefaultArgsAndGarbageCollection

	| weakArray morph signalConsumer signalProducer |
	morph := Morph new.
	signalConsumer := SignalConsumer new.
	signalProducer := SignalProducer new.
	
	weakArray := WeakArray
		with: morph
		with: signalConsumer
		with: signalProducer.
	
	self deny: (SignalConnectionsRepository instance includesKey: signalProducer).

	signalConsumer
		connect: signalProducer
		signal: #newSignalProduced
		toSelector: #value:
		pattern: {#=. morph}.

	self
		assert: (SignalConnectionsRepository instance includesKey: signalProducer);
		assert: (SignalConnectionsRepository instance keys anySatisfy: [:c | c isKindOf: SignalProducer]);
		assert: ({morph. signalConsumer. signalProducer} hasEqualElements: weakArray).
	
	morph := nil.
	signalConsumer := nil.
	signalProducer := nil.

	self flag: #fixme.
	"SignalConnectionsRepository instance finalizeLater.
	Smalltalk garbageCollect.
	Processor yield." "Let weak array finalization process run."

"	self
		deny: (SignalConnectionsRepository instance keys anySatisfy: [:c | c isKindOf: SignalProducer]);
		assert: ({nil. nil. nil} hasEqualElements: weakArray copy)."