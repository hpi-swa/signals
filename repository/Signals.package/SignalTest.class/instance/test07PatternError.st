tests
test07PatternError

	self
		should: [consumer connect: producer signal: #valueChanged: toSelector: #toggleSwitch pattern: #(1)] raise: Error;
		should: [consumer connect: producer signal: #valueChanged: toSelector: #value: pattern: #(2)] raise: Error;
		should: [consumer connect: producer signal: #valueChanged:with: toSelector: #value: pattern: #(2 1)] raise: Error;
		should: [consumer connect: producer signal: #valueChanged: toSelector: #value: pattern: #()] raise: Error.