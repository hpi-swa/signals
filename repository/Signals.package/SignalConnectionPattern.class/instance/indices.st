private
indices
	"Return an array with all reference indices. Discard defaults."
	
	| result nextIsDefault |
	result := OrderedCollection new.
	nextIsDefault := false.
	
	self mapping
		ifNotNil: [self mapping do: [:ea |
			nextIsDefault
				ifTrue: [nextIsDefault := false]
				ifFalse: [ea = #=
					ifTrue: [nextIsDefault := true]
					ifFalse: [result add: ea]]]].
		
	^ result