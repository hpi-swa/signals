as yet unclassified
checkValue: expected

	value ~= expected ifTrue: [Error signal: 'Value check failed!'].