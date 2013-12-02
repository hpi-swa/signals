*si-reflection
allSignalEmitsFrom: aSenderClass signal: aSignal

	| connectionSelectors result |
	result := self allCallsOn: aSignal from: aSenderClass. "Fetch connections AND signal sends.."
	
	connectionSelectors := Object selectors select: [:sel | sel startsWith: #connect:].
	connectionSelectors do: [:sel | 
		| calls |
		calls := self allCallsOn: sel from: aSenderClass.
		"Hint: Lose signal sends that are in the same message as the connection. "
		result := result reject: [:e | calls includes: e]].
	
	^ result