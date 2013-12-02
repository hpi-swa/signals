tests
test01SimplePattern

	pattern mapping: #(5 4 3 2 1).
	
	self
		assert: 5 equals: pattern size;
		deny: pattern isEmpty;
		assert: 5 equals: pattern maxIndex;
		assert: 1 equals: pattern minIndex.