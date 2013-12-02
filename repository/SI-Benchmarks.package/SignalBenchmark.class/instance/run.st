as yet unclassified
run

	| preparationTime triggeringTime |
	self setUp.
	
	self receiverCount timesRepeat: [
		(receivers add: SignalBenchmarkReceiver new)].
	
	preparationTime := self needsPreparation
		ifTrue: [ [receivers do: [:receiver | self prepareOneBindingFor: receiver]] timeToRunWithoutGC ]
		ifFalse: [0]..
	
	triggeringTime := [self triggerOneEventWith: 42] timeToRunWithoutGC.
	
	"Verify validity of results."
	receivers do: [:receiver | receiver checkValue: 42].
	
	self tearDown.
	^ self class -> {preparationTime. triggeringTime}