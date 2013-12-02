finalization
finalizeValues

	| interval |
	interval := lastFinalizeTime
		ifNil: [self finalizeTimeOut]
		ifNotNil: [:t | (t to: DateAndTime now) duration asMilliSeconds].
	
	interval < 0
		ifTrue: [interval := self finalizeTimeOut].
	
	interval < self finalizeTimeOut
		ifTrue: [^ self].
		
	self critical: [super finalizeValues].
	
	lastFinalizeTime := DateAndTime now.