critical
critical: aBlock

	mutex ifNil: [mutex := Mutex new].
	^ mutex critical: aBlock