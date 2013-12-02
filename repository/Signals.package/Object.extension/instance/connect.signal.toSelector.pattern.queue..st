*signals-core
connect: aSender signal: aSignal toSelector: aSelector pattern: argPattern queue: aSharedQueue
	"Create a queued connection. Receiver will not be called directly but a valuable block with the call will be stored into a queue. The queue has to be processed somewhere else. See #emit."

	aSender
		connectSignal: aSignal
		to: self
		selector: aSelector
		pattern: argPattern
		queue: aSharedQueue
		blocking: false.