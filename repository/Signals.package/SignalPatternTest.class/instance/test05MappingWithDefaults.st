tests
test05MappingWithDefaults

	pattern mapping: #(2 1 =foobar).
	
	self
		assert: pattern hasIndices;
		assert: {5. 'dog'. #foobar} equals: (pattern mapArguments: {'dog'. 5}).