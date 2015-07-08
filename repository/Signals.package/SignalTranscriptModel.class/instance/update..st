updating
update: aSymbol

	lastUpdate := aSymbol.

	(aSymbol beginsWith: #appendEntry)
		ifTrue: [lastEntry := Transcript contents].