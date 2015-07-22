tests
test35SignalSpyVerboseMode

	| spy stm |
	"Workaround for filtreeCI script on TravisCI."
	(Transcript isKindOf: TravisCITranscriptStream)
		ifTrue: [^ self "Just pass."].
	
	spy := SignalSpy onSender: producer signal: #valueChanged:.
	spy verbose: true.
	
	stm := SignalTranscriptModel new register.
	
	producer value: #DontSpyOnMe.	
	
	self assert: stm lastUpdate notNil.
	self assert: (stm lastUpdate beginsWith: #appendEntry).
	self assert: String cr, '#(#valueChanged: #(#DontSpyOnMe))' equals: stm lastEntry.
	
	stm unregister.
