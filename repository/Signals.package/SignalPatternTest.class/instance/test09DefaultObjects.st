tests
test09DefaultObjects

	pattern mapping: {#=. Morph new color: Color yellow}.
	
	self
		assert: Color yellow equals: (pattern mapArguments: {}) first color.