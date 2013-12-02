printing
printString

	^ '<Signal: {1} >> {2}>' format: {
		self theClass.
		self selector}