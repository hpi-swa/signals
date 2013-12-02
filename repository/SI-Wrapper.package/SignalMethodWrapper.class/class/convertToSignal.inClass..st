convertig
convertToSignal: aSelector inClass: aClass

	| wrapper |
	(aClass whichClassIncludesSelector: aSelector) ifNotNilDo: [ :c |
		c >> aSelector literalsDo: [ :literal |
			(literal == #emit or: [literal == #emitAlways])
				ifTrue: [^ self "Already a signal." ] ] ].
	
	wrapper := self on: aSelector inClass: aClass.
	
	SignalMethodWrapperRepository critical: [
		(SignalMethodWrapperRepository instance anySatisfy: [:w |
			w wrappedClass = aClass and: [w clientSelector = aSelector]]) ifTrue: [^ self "Already a signal via wrapping."].
		SignalMethodWrapperRepository instance add: wrapper].
	
	wrapper install