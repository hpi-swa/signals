tests
test01ConnectDisconnect

	self assert: producer signalConnections isEmpty.
	consumer connect: producer signal: #valueChanged: toSelector: #value:.
	self assert: 1 equals: producer signalConnections size.
	
	self
		assert: (producer disconnectSignal: #valueChanged:);
		assert: producer signalConnections isEmpty;
		deny: (producer disconnectSignal: #valueChanged:).
		
	self connect: producer signal: #valueChanged: to: consumer selector: #value:.
	self assert: 1 equals: producer signalConnections size.

	self
		assert: (producer disconnectSignal: #valueChanged: from: consumer);
		assert: producer signalConnections isEmpty;
		deny: (producer disconnectSignal: #valueChanged: from: consumer).
		
	self connect: producer signal: #valueChanged: to: consumer selector: #value:.
	
	self
		assert: (producer disconnectSignal: #valueChanged: from: consumer selector: #value:);
		assert: producer signalConnections isEmpty;
		deny: (producer disconnectSignal: #valueChanged: from: consumer selector: #value:).
		
	self connect: producer signal: #valueChanged: to: consumer selector: #value:.
	self 
		deny: (producer disconnectSignal: #shouldNotExist);
		deny: producer signalConnections isEmpty.