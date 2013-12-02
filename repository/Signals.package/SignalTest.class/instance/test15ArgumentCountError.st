tests
test15ArgumentCountError

	self
		should: [consumer connect: producer signal: #newSignalProduced toSelector: #value:]
		raise: Error.