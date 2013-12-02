*signals-core
emitAlways
	"Less restrictive version of #emit, e.g., does not check if sender and receiver are the same object. Makes signals emittable from the outside."
	
	| signalCtx signal args |
	signalCtx := thisContext sender.
	signal := signalCtx method.
	
	"Extract arguments."
	args := Array new: signal numArgs.
	(1 to: signal numArgs) do: [:index |
		args at: index put: (signalCtx tempAt: index)].
	
	self emitSignal: signal selector arguments: args sender: self.