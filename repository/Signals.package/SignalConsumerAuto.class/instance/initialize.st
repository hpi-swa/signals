initialize-release
initialize

	super initialize.
	producer := SignalProducer new.
	producerTwo := SignalProducer new.
	
	self createAutoSignalConnections.