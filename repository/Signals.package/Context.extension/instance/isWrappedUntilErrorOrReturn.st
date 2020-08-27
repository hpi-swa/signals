*signals-core
isWrappedUntilErrorOrReturn
	"Check whether the receiver is wrapped via #runUntilErrorOrReturnFrom:. This usually happens when stepping over a message send in a debugger."

	| handlerBlock |
	(self selector = #on:do:
		and: [self sender selector = #ensure:])
		ifFalse: [^ false].
	
	handlerBlock := self tempAt: 2.
	handlerBlock isBlock ifFalse: [^ false].
	^ handlerBlock method selector = #runUntilErrorOrReturnFrom: