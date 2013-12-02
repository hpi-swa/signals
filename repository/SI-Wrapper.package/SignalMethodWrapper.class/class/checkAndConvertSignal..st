convertig
checkAndConvertSignal: aSignalAndClass
	
	(SignalConnectionsRepository checkSignal: aSignalAndClass first inClass: aSignalAndClass second)
		ifFalse:[self convertToSelector: aSignalAndClass first inClass: aSignalAndClass second].