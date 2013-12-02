tests
test23EmitPublicSignal

	consumer connect: producer signal: #valueChanged2: toSelector: #value:.
	
	self assert: nil equals: consumer value.
	producer valueChanged2: #foobar.
	self assert: #foobar equals: consumer value.