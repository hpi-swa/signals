*signals-morphic
emitInOwnerChain
	"Special kind of signals that will be handled by the owner-chain."
	
	| signalCtx signal args owner |
	signalCtx := thisContext sender.
	signal := signalCtx method.
	
	"Extract arguments."
	args := Array new: signal numArgs.
	(1 to: signal numArgs) do: [:index |
		args at: index put: (signalCtx tempAt: index)].
	
	"Start handling"
	owner := self.
	[(owner := owner owner) notNil] whileTrue: [
		(owner emitSignalInOwnerChain: signal selector arguments: args sender: self)
			ifTrue: [^ self "Done."]].
	