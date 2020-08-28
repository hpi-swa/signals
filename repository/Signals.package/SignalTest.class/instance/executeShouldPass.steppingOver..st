private
executeShouldPass: aBlock steppingOver: selector
	"Simulate aBlock until the next step will be a send to selector. Then reproduce the behavior of the debuugger's stepOver button. Check whether the step was completed without any exception being raised."

	| proc topContext sender |
	proc := aBlock newProcess.
	topContext := proc suspendedContext.
	[proc runUntil: [:ctx | ctx willReallySend
		and: [ctx selectorToSendOrSelf = selector]].
	proc isTerminated ifTrue: [self error: 'Simulation error'].
	
	"Perform the actual stepping logic"
	sender := proc suspendedContext.
	proc completeStep: proc suspendedContext.
	
	^ proc suspendedContext == sender]
		ensure: [proc terminate]