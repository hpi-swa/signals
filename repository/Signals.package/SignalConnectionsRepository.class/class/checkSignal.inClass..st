testing
checkSignal: aSignal inClass: aClass
	"Check whether there are connections for the signal in the class."
	
	self critical: [
		self instance associationsDo: [:assoc |
			assoc key ifNotNil: [:sender | (sender class = aClass and: [
					assoc value keys anySatisfy: [:signalKey |
						signalKey selector = aSignal]]) ifTrue: [^ true]]]].

	^ false