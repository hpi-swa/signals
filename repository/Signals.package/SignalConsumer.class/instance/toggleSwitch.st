slots
toggleSwitch

	switch := self switchState = #off
		ifTrue: [#on]
		ifFalse: [#off].