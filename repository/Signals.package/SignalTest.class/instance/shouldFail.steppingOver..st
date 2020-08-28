assertions
shouldFail: aBlock steppingOver: selector

	^ self deny: (self executeShouldPass: aBlock steppingOver: selector)