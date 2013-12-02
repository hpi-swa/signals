mapping
mapArguments: someArguments useSender: aSender
	"Map index 0 to the sender."
	
	| result nextIsDefault offset |
	self mapping ifNil: [^ someArguments "Identity."].
	
	result := Array new: self size.
	nextIsDefault := false.
	offset := 0.
	
	self mapping withIndexDo: [:ea :index |
			nextIsDefault
				ifTrue: [nextIsDefault := false. result at: index - offset put: ea "Use default."]
				ifFalse: [ea = #=
					ifTrue: [nextIsDefault := true. offset := offset + 1 "Escape char found."]
					ifFalse: [
						ea = 0 "Send given sender as argument"
							ifTrue: [result at: index - offset put: aSender]
							ifFalse: [result at: index - offset put: (someArguments at: ea)]]]].
	
	^ result collect: [:each | each class == WeakArray
		ifTrue: [each first]
		ifFalse: [each]]