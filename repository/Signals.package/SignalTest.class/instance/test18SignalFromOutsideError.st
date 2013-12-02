tests
test18SignalFromOutsideError
	"There should be an error if another class tries to emit a signal from the outside."
	
	self
		should: [producer valueChanged: #foobar] raise: Error;
		should: [[producer valueChanged: #foobar] value] raise: Error;
		shouldnt: [producer valueInBlock: #foobar] raise: Error.