tests
test12SignalSpyConcurrent

	| spy |
	spy := SignalSpy onSender: producer signal: #valueChanged:.
	process := [producer value: #DontSpyOnMe] fork.
	self assert: {#valueChanged:. {#DontSpyOnMe}} equals: spy waitForNextSignal.