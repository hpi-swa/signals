*signals-core
uiProcess
	"Compatibility for Pharo."

	(Smalltalk includesKey: #Project)
		ifTrue: [^ (Smalltalk at: #Project) uiProcess].

	self flag: #pharo.
	(self class classVarNames includes: #UIProcess)
		ifTrue: [^ self class classPool at: #UIProcess].