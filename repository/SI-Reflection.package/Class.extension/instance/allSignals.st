*si-reflection
allSignals

	^ self allSelectors select: [:selector | (self lookupSelector: selector) isSignal]