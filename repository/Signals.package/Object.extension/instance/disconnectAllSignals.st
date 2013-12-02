*signals-core
disconnectAllSignals
	
	self signalMutex critical: [
		self signalConnectionsRepository
			removeKey: self
			ifAbsent: [^ false]].
		
	^ true