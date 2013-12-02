*signals-core
connect: aSender signal: aSignal toSelector: aSelector queue: aSharedQueue blocking: aBoolean
	"Connect a selector from me with the signal of a sender."

	aSender
		connectSignal: aSignal
		to: self
		selector: aSelector
		pattern: nil
		queue: aSharedQueue
		blocking: aBoolean.