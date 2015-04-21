*signals-core-private
emitSignal: signal arguments: args sender: aSender
	"Private. Performs the triggering of callbacks."

	| actions |
	
	"Fetch targets and schedule dispatch."
	actions := OrderedCollection new. "Buffer actions to free the mutex in time."
	self signalMutex critical: [
		aSender hasSignalConnections ifFalse: [^ self].
		
		(aSender signalConnections at: (SignalKey signal: signal sender: aSender) ifAbsent: [^ self]) associationsDo: [ :association |
			association key ifNotNil: [ :receiver | "Don't let the key go away -> weak dictionary"
				association value do: [ :connectionConfiguration |
					| selector pattern queue filteredArgs blocking forceUiProcess |
					selector := connectionConfiguration selector.
					pattern := connectionConfiguration pattern.
					queue := connectionConfiguration queue.
					blocking := connectionConfiguration isBlocking.
					forceUiProcess := connectionConfiguration forceUiProcess.
					
					forceUiProcess ifTrue: [
						blocking := false. "Never block here."
						queue := Processor activeProcess == Project current uiProcess
							ifTrue: [nil] "synchron processing in UI process"
							ifFalse: [WorldState deferredUIMessages]]. "asynchron processing in UI process"
					
					pattern
						ifNil: [ "no argument changes"
							filteredArgs := args]
						ifNotNil: [ "shadowing and reordering"
							filteredArgs := pattern mapArguments: args useSender: aSender].
					actions add: (queue "queued connection or direct connection?"
						ifNil: [[receiver perform: selector withArguments: filteredArgs]]
						ifNotNil: [
							blocking
								ifTrue: [ | thisProcess |
									thisProcess := Processor activeProcess.
									[queue nextPut: [receiver perform: selector withArguments: filteredArgs. thisProcess resume].  thisProcess suspend]]
								ifFalse: [ [queue nextPut: [receiver perform: selector withArguments: filteredArgs]] ] ] ) ] ] ] ].
	
	"Dispatch outside the mutex."
	actions do: [:action | action value].
	
	"TODO: Handle dispatching errors with automatic disconnections."