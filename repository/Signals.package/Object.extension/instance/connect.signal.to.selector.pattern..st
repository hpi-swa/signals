*signals-core
connect: aSender signal: aSignal to: aReceiver selector: aSelector pattern: argPattern
	"Shadow or reorder arguments before invoking selector on receiver, e.g.,  #(1 4 3)"

	aSender
		connectSignal: aSignal
		to: aReceiver
		selector: aSelector
		pattern: argPattern
		queue: nil
		blocking: false