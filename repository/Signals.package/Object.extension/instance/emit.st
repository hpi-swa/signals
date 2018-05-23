*signals-core
emit
	"Calling this from a method makes the method to a signal."

	| signalCtx signal args|
	signalCtx := thisContext sender.
	signal := signalCtx method.
	
	"Wrapping this method... sigh..."
	signal selector = #run:with:in: ifTrue: [
		signalCtx := signalCtx sender.
		signal := signalCtx method].
	
	"Do not allow external emitting of signals. Support for method wrappers."
	signalCtx sender receiver == signalCtx receiver ifFalse: [ | trap dodged |
		"Check for different implementations of method wrappers."
		trap := true.
		dodged := false.
		
		"http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/SwaUtilities"
		(dodged not and: [signalCtx sender sender receiver isKindOf: (Smalltalk at: #MwMethodWrapper ifAbsent: [nil])])
			ifTrue: [
				dodged := true.
				trap := signalCtx sender sender sender sender sender sender receiver ~~ signalCtx receiver].

		"Squeak SUnit"
		(dodged not and: [signalCtx sender receiver class == (Smalltalk at: #TestCoverage ifAbsent: [nil])])
			ifTrue: [
				dodged := true.
				trap := signalCtx sender sender receiver ~~ signalCtx receiver].

		"SmalltalkCI - https://github.com/hpi-swa/smalltalkCI"
		(dodged not and: [signalCtx sender receiver class == (Smalltalk at: #SCICoverageWrapper ifAbsent: [nil])])
			ifTrue: [dodged := true. trap := false "ignore"].
		
		trap ifTrue: [Error signal: 'Must not emit an object''s signal from the outside!']].
	
	"Extract arguments."
	args := Array new: signal numArgs.
	(1 to: signal numArgs) do: [:index |
		args at: index put: (signalCtx tempAt: index)].
	
	self emitSignal: signal selector arguments: args sender: self.