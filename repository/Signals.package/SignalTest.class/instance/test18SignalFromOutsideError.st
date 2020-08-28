tests
test18SignalFromOutsideError
	"There should be an error if another class tries to emit a signal from the outside."

	self
		should: [producer valueChanged: #foobar] raise: Error;
		should: [[producer valueChanged: #foobar] value] raise: Error;
		shouldnt: [producer valueInBlock: #foobar] raise: Error.
	
	"Regression tests for debugging the signal emission. See Object >> #emit."
	self
		shouldFail: [producer valueChanged: #foobar] steppingOver: #valueChanged:;
		shouldFail: [producer valueChanged: #foobar] steppingOver: #emit;
		shouldPass: [producer value: #foobar] steppingOver: #value:;
		shouldPass: [producer value: #foobar] steppingOver: #valueChanged:;
		shouldPass: [producer value: #foobar] steppingOver: #emit.