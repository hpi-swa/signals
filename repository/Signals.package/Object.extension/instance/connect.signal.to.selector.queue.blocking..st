*signals-core
connect: aSender signal: aSignal to: aReceiver selector: aSelector queue: aSharedQueue blocking: aBoolean

	aSender
		connectSignal: aSignal
		to: aReceiver
		selector: aSelector
		pattern: nil
		queue: aSharedQueue
		blocking: aBoolean