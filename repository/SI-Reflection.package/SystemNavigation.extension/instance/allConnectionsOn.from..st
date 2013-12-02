*si-reflection
allConnectionsOn: aSignal from: aClass
	"Return all methods of a class that contain connections on the given signal."

	| connectionSelectors result tmp |
	tmp := self allCallsOn: aSignal from: aClass. "Fetch connections AND signal sends.."
	
	result := OrderedCollection new.
	connectionSelectors := Object selectors select: [:sel | sel startsWith: #connect:].
	connectionSelectors do: [:sel | 
		result addAll: (self allCallsOn: sel from: aClass)].
	
	^ result select: [:e | tmp includes: e]. "Return the intersection"