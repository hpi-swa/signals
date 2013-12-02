*signals-core
disconnectSignal: aSignal from: aReceiver selector: aSelector
	
	self signalMutex critical: [
		(self signalConnections includesKey: (SignalKey signal: aSignal sender: self))
			ifFalse: [^ false].
			
		((self signalConnections at: (SignalKey signal: aSignal sender: self))
			at: aReceiver
			ifAbsent: [^ false]) "weak"
			removeAllSuchThat: [:connectionConfiguration | connectionConfiguration selector = aSelector].
	
		((self signalConnections at: (SignalKey signal: aSignal sender: self))
			at: aReceiver
			ifAbsent: [^ true]) "weak"
			ifEmpty: [self disconnectSignal: aSignal from: aReceiver]].
	
	^ true