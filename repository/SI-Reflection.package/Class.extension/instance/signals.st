*si-reflection
signals

	^ self selectors select: [:selector | (self lookupSelector: selector) isSignal]