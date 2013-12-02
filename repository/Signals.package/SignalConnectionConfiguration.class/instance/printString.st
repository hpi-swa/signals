printing
printString

	^ '<#{1} {2} {3}>' format: {
		self selector.
		self isBlocking ifTrue: ['blocking'] ifFalse: [''].
		self forceUiProcess ifTrue: ['ui'] ifFalse: ['']}