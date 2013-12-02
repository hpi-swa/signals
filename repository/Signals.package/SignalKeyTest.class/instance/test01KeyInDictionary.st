tests
test01KeyInDictionary

	| dict |
	dict := Dictionary new.
	dict at: (SignalKey signal: #valueChanged: sender: SignalProducer new) put: #foobar.
	
	self assert: #foobar equals: (dict at: (SignalKey signal: #valueChanged: sender: SignalProducer new)).