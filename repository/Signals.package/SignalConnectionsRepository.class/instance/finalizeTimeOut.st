accessing
finalizeTimeOut
	"Time between cleanup."
	
	^ finalizeTimeOut ifNil: [5000 "ms"]