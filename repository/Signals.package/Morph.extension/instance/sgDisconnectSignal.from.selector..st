*signals-morphic
sgDisconnectSignal: aSignal from: aReceiver selector: aSelector

	| connections |
	connections := (self signalConnectionsForOwnerChain
		at: aSignal ifAbsent: [^ self])
		at: aReceiver ifAbsent: [^ self].
		
	connections removeAllSuchThat: [:c | c selector == aSelector].
	
	connections ifEmpty: [(self signalConnectionsForOwnerChain at: aSignal) removeKey: aReceiver].
	(self signalConnectionsForOwnerChain at: aSignal) ifEmpty: [
		self signalConnectionsForOwnerChain removeKey: aSignal].