wrappers
wrapperCount

	^ SignalMethodWrapperRepository instance
		count: [:wrapper | wrapper definingClass == self]