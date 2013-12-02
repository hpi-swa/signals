tests
test05PatternsReorder

	consumer connect: producer signal: #valueChanged:and: toSelector: #value: pattern: #(2).
	
	self assert: consumer value isNil.
	producer value: 'foobar' and: 'blubb'.
	self assert: 'blubb' equals: consumer value.	