*signals-core
disconnectSignal: aSignal from: aReceiver
	
	self signalMutex critical: [
		(self signalConnections includesKey: (SignalKey signal: aSignal sender: self))
			ifFalse: [^ false].
			
		(self signalConnections at: (SignalKey signal: aSignal sender: self))
			removeKey: aReceiver
			ifAbsent: [^ false].
	
		(self signalConnections at: (SignalKey signal: aSignal sender: self))
			ifEmpty: [^ self disconnectSignal: aSignal]].
		
	^ true