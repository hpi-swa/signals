*signals-core
createAutoSignalConnections
	"Transform all selectors like #onSenderSignal:arg1:arg2: into corresponding connection create statements and execute them. The sender has to be an instance variable with the same name and has to be initialized yet."
	
	| senderSignalPatterns |
	senderSignalPatterns := self class selectors
		select: [:sel | sel beginsWith: #on]
		thenCollect: [:sel | sel allButFirst: 2].
	
	self class allInstVarNames do: [:var | 
		senderSignalPatterns
			select: [:pattern | pattern withFirstCharacterDownshifted beginsWith: var]
			thenDo: [:pattern |
				| sender signal |
				sender := self instVarNamed: var.
				signal := (pattern allButFirst: var size) withFirstCharacterDownshifted asSymbol.
				(sender respondsTo: signal) ifTrue: [ "enable 'lineEdit' and 'lineEditPassword' inst var names"
					self
						connect: sender
						signal: signal
						toSelector: (#on, pattern) asSymbol]]].