tests
test04SimpleMapping

	pattern mapping: #(3 1 2).
	
	self assert: {#foobar. 'dog'. 5} equals: (pattern mapArguments: {'dog'. 5. #foobar}).