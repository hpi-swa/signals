updating
update: aSymbol

	lastUpdate := aSymbol.

	aSymbol = #appendEntry
		ifTrue: [lastEntry := Transcript contents].