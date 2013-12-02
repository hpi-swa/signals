tests
test10weakMapping

	pattern mapping: {#=. Morph new color: Color yellow}.
	
	Smalltalk garbageCollect.
	
	self assert: (pattern mapArguments: {}) first isNil.