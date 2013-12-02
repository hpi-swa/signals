tests
test08DefaultsOnly

	pattern mapping: #(=dog =foobar).
	
	self
		deny: pattern hasIndices;
		assert: 0 equals: pattern numberOfNonDefaults.