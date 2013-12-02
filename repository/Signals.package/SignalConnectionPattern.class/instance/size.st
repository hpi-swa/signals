accessing
size

	| nextIsDefault |
	nextIsDefault := false.
	
	^ self mapping
		ifNotNil: [self mapping count: [:ea |
			nextIsDefault
				ifTrue: [nextIsDefault := false]
				ifFalse: [ea = #=
					ifTrue: [nextIsDefault := true]
					ifFalse: [true]]]]
		ifNil: [0]