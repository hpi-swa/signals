tests
test03Disconnect

	sut sgConnectSignal: #valueChanged: toSelector: #value:.
	self assert: sut signalConnectionsForOwnerChain notEmpty.
	
	sut sgDisconnectSignal: #valueChanged: fromSelector: #value:.
	self assert: sut signalConnectionsForOwnerChain isEmpty.