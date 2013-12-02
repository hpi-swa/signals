instance creation
signal: aSignal sender: aSender

	^ self new
		theClass: aSender class;
		selector: aSignal.