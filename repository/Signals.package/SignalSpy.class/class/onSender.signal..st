instance creation
onSender: aSender signal: aSignal

	^ self new
		addSender: aSender
		signal: aSignal