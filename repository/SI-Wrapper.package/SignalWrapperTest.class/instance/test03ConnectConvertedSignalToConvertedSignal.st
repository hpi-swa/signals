tests
test03ConnectConvertedSignalToConvertedSignal

	| producer consumer |
	producer := SignalProducerByWrapping new.
	consumer := SignalConsumer new.
	
	"Transform #value: from consumer to signal."
	consumer connect: consumer signal: #value: toSelector: #toggleSwitch.
	"Transform #value: from producer to signal."
	consumer connect: producer signal: #value: toSelector: #value:.
	producer value: #foobar.
	
	self
		assert: #on
		equals: consumer switchState.