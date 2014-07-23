*signals-morphic
sgConnectSignal: aSignal to: receiver selector: aSelector pattern: argPattern
	"Connect owner-chain-signals with this receiver. Highly dynamic as sender is unknown at the time of connection setup."
	
	| numArgsSender numArgsReceiver fixedPattern |
	"Convert pattern array to custom pattern object."
	fixedPattern := argPattern ifNotNil: [SignalConnectionPattern new mapping: argPattern].
	
	"Check if messages are available."
	(receiver respondsTo: aSelector)
		ifFalse: [Error signal: 'Could not connect signal to receiver!'].
	
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

	"Add the connection."
	((self signalConnectionsForOwnerChain
		at: aSignal ifAbsentPut: [WeakIdentityKeyDictionary new])
		at: receiver ifAbsentPut: [OrderedCollection new])
		add: (SignalConnectionConfiguration new
			selector: aSelector;
			pattern: fixedPattern).