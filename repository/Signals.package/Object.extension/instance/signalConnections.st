*signals-core-private
signalConnections

	^ self signalConnectionsRepository
		at: self
		ifAbsentPut: [Dictionary new]