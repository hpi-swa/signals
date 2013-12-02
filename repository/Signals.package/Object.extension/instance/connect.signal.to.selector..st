*signals-core
connect: aSender signal: aSignal to: aReceiver selector: aSelector
	"Mediator: Connect a signaling object with a receiver."

	aSender
		connectSignal: aSignal
		to: aReceiver
		selector: aSelector
		pattern: nil
		queue: nil
		blocking: false