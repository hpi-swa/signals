tests
test13SignalSpySpecificSignal

	| spy |
	spy := SignalSpy onSender: producer signal: #valueChanged:.
	process := [
		producer produceSignal. "will be discarded"
		producer value: #DontSpyOnMe] fork.
	self assert: {#valueChanged:. {#DontSpyOnMe}} equals: (spy waitForSignal: #valueChanged:).