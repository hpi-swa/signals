*signals-core
connect: aSender signal: aSignal toSelector: aSelector pattern: argPattern
	"Connect a selector from me with the signal of a sender."

	aSender
		connectSignal: aSignal
		to: self
		selector: aSelector
		pattern: argPattern
		queue: nil
		blocking: false.