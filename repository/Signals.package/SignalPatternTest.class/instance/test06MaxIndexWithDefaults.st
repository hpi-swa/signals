tests
test06MaxIndexWithDefaults

	pattern mapping: #(2 1 =foobar).
	
	self assert: 2 equals: pattern maxIndex.