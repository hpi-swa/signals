accessing
value: aValue

	self setProperty: #value toValue: aValue.
	self valueChanged: aValue.