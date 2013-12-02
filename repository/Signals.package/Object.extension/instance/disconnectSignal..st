*signals-core
disconnectSignal: aSignal
	
	self signalMutex critical: [
		self signalConnections
			removeKey: (SignalKey signal: aSignal sender: self)
			ifAbsent: [^ false]].
		
	^ true