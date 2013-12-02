*signals-core-private
connectSignal: aSignal to: aReceiver selector: aSelector pattern: argPattern queue: aSharedQueue blocking: aBoolean
	"Private. "

	| forceUiProcess numArgsSender numArgsReceiver fixedPattern |
	"Convert pattern array to custom pattern object."
	fixedPattern := argPattern ifNotNil: [SignalConnectionPattern new mapping: argPattern].
	
	"Check if messages are available."
	(self respondsTo: aSignal) ifFalse: [
		Error signal: ('Signal connection failed! {1} has no signal named #{2}' format: {self. aSignal})].
	(aReceiver respondsTo: aSelector) ifFalse: [
		Error signal: ('Signal connection failed! {1} has no selector named #{2}' format: {aReceiver. aSelector})].
	
	"Check if sender sends at least enough arguments if pattern is empty."
	numArgsSender := aSignal count: [:c | c = $:].
	numArgsReceiver := aSelector count: [:c | c = $:].
	(numArgsSender < numArgsReceiver and: [fixedPattern isNil])
		ifTrue: [Error signal: 'Could not connect sender to receiver! Receiver expects more arguments!'].
	
	"Check if pattern size is correct."
	fixedPattern ifNotNil: [
		(((fixedPattern hasIndices not or: [fixedPattern minIndex >= 0])
			and: [numArgsReceiver == fixedPattern size])
			and: [fixedPattern hasIndices not or: [numArgsSender >= fixedPattern maxIndex]])
			ifFalse: [Error signal: 'Could not connect sender to receiver! Pattern is invalid!']].
	
	"Auto-truncate unnecessary arguments if pattern is not given."
	(numArgsSender > numArgsReceiver and: [fixedPattern isNil])
		ifTrue: [fixedPattern := SignalConnectionPattern new
			mapping: ((1 to: numArgsReceiver) collect: [:i | i])].

	"Signals sent in a non-multiprogramming environment should be processed in the UI process no matter from which process they are emitted."
	forceUiProcess := Processor activeProcess == UIManager default uiProcess and: [aSharedQueue isNil].
	
	"Add the connection."
	self signalMutex critical: [
		(self signalConnections includesKey: (SignalKey signal: aSignal sender: self))
			ifFalse: [self signalConnections
				at: (SignalKey signal: aSignal sender: self) "configureFinalize"
				put: WeakIdentityKeyDictionary new].
		
		((self signalConnections
			at: (SignalKey signal: aSignal sender: self))
			at: aReceiver
			ifAbsentPut: [OrderedCollection new])
			add: (SignalConnectionConfiguration new
				selector: aSelector;
				pattern: fixedPattern;
				queue: aSharedQueue;
				isBlocking: aBoolean;
				forceUiProcess: forceUiProcess)].
		
	"Signals-Wrapper extension --- If signal is not a signal, make it to a signal."
	"(Smalltalk includesKey: #SignalMethodWrapper)
		ifTrue: [(Smalltalk at: #SignalMethodWrapper) convertToSignal: aSignal inClass: self class]."