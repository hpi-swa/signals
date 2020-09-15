assertions
shouldPass: aBlock steppingOver: selector

	^ self assert: (self executeShouldPass: aBlock steppingOver: selector)