tests
test02Signal

	ViTestMorph new addMorph: (
		ViTestMorph new addMorph: sut).
		
	self
		assert: nil equals: sut value;
		assert: nil equals: sut owner value;
		assert: nil equals: sut owner owner value.
	
	sut owner owner sgConnectSignal: #valueChanged: toSelector: #value:.
	sut value: #foobar.
	
	self
		assert: #foobar equals: sut value;
		assert: nil equals: sut owner value;
		assert: #foobar equals: sut owner owner value.