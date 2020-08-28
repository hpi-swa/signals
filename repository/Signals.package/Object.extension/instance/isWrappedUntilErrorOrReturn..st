*signals-core-private
isWrappedUntilErrorOrReturn: aContext
	"Check whether aContext is wrapped via #runUntilErrorOrReturnFrom:. This usually happens when stepping over a message send in a debugger."
	"Note: This should be an extension method to Context but is not because this class did not exist under this name in Squeak 5.1."

	| handlerBlock |
	(aContext selector = #on:do:
		and: [aContext sender selector = #ensure:])
		ifFalse: [^ false].
	
	handlerBlock := aContext tempAt: 2.
	handlerBlock isBlock ifFalse: [^ false].
	^ handlerBlock method selector = #runUntilErrorOrReturnFrom: