*si-reflection
isSignal

	self selector == #emit ifTrue: [^ false].
	self selector == #emitAlways ifTrue: [^ false].

	self literalsDo: [:literal |
		literal == #emit ifTrue: [^ true].
		literal == #emitAlways ifTrue: [^ true]].
	^ false