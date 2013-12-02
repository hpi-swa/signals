tests
test34SignalSpyMultiple

	| spy |
	spy := SignalSpy new.
	spy addSender: producer signals: #(valueChanged: valueChanged:and:).

	producer
		value: #DontSpyOnMe;
		value: #LetMeAlone and: #GetAHike.

	self
		assert: {#valueChanged:. {#DontSpyOnMe}} equals: spy waitForNextSignal;
		assert: {#valueChanged:and:. {#LetMeAlone. #GetAHike}} equals: spy waitForNextSignal.