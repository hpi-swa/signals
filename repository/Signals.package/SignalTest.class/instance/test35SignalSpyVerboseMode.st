tests
test35SignalSpyVerboseMode

	| spy stm |
	"Workaround for builderCI script on TravisCI."
	(Transcript isKindOf: FileStream)
		ifTrue: [^ self "Just pass."].
	
	spy := SignalSpy onSender: producer signal: #valueChanged:.
	spy verbose: true.
	
	stm := SignalTranscriptModel new register.
	
	producer value: #DontSpyOnMe.	
	
	self assert: (stm lastUpdate beginsWith: #appendEntry).
	self assert: String cr, '#(#valueChanged: #(#DontSpyOnMe))' equals: stm lastEntry.
	
	stm unregister.