*si-ob-morphic
browserIcon: aClassDescription selector: aSelector
	"Answer an icon to be shown for the selector aSymbol in aClassDescription."

	aClassDescription methodDictionary at: aSelector ifPresent: [ :method |
		method literalsDo: [ :literal |
			(literal == #halt or: [ literal == #halt: or: [ literal == #haltIfNil or: [ literal == #haltIf: or: [ literal == #haltOnce or: [ literal == #haltOnce: or: [ literal == #haltOnCount: or: [ literal == #halt:onCount: ] ] ] ] ] ] ])
				ifTrue: [ ^ #breakpoint ].
			(literal == #flag: or: [ literal == #needsWork or: [ literal == #notYetImplemented ] ])
				ifTrue: [ ^ #flag ].
			"BEGIN: Signal extension"
			literal == #emit
				ifTrue: [^ #signal ].
			literal == #emitAlways
				ifTrue: [^ #signal2 ].
			literal == #emitInOwnerChain
				ifTrue: [^ #signal3 ]
			"END: Signal extension" ] ].
	^ (aClassDescription isOverride: aSelector)
		ifTrue: [
			(aClassDescription isOverridden: aSelector)
				ifTrue: [ #arrowUpAndDown ]
				ifFalse: [ #arrowUp ] ]
		ifFalse: [
			(aClassDescription isOverridden: aSelector)
				ifTrue: [ #arrowDown ]
				ifFalse: [ #blank ] ]