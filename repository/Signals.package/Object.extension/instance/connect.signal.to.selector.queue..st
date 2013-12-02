*signals-core
connect: aSender signal: aSignal to: aReceiver selector: aSelector queue: aSharedQueue
	"Store an incoming signal connection request. This is a direct connection, so the receiver will be called synchonously after the signal was emitted. See #emit."
	
	aSender
		connectSignal: aSignal
		to: aReceiver
		selector: aSelector
		pattern: nil
		queue: aSharedQueue
		blocking: false