finalization
configureFinalize
	"What should happen, if I die?"

	(Smalltalk at: #SignalMethodWrapper ifAbsent: [])
		ifNotNil: [:wrapperClass |
			self
				toFinalizeSend: #checkAndConvertSignal:
				to: wrapperClass
				with: {self selector. self theClass}].