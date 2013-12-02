tests
test02ConnectError

	self
		should: [consumer connect: producer signal: #shouldNotExist toSelector: #toggleSwitch] raise: Error;
		should: [consumer connect: producer signal: #valueChanged: toSelector: #shouldNotExist] raise: Error;
		should: [self connect: producer signal: #shouldNotExist to: consumer selector: #toggleSwitch] raise: Error;
		should: [self connect: producer signal: #valueChanged: to: consumer selector: #shouldNotExist] raise: Error.