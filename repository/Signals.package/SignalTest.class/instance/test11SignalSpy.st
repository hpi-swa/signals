tests
test11SignalSpy

	| spy |
	spy := SignalSpy onSender: producer signal: #valueChanged:.
	producer value: #DontSpyOnMe.	
	self assert: {#valueChanged:. {#DontSpyOnMe}} equals: spy waitForNextSignal.