convertig
convertToSelector: aSignal inClass: aClass
	
	SignalMethodWrapperRepository critical: [ | wrapper |
		wrapper := (SignalMethodWrapperRepository instance
			detect: [:w | w wrappedClass = aClass and: [w clientSelector = aSignal]]
			ifNone: [^ self "Is no wrapped signal"]).
		wrapper uninstall.
		SignalMethodWrapperRepository instance remove: wrapper].