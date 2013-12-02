testing
test02FindSignalEmits

	self
		assert: #(value: valueInBlock: valueEx:) asOrderedCollection
		equals: ((SystemNavigation default
			allSignalEmitsFrom: SignalProducer
			signal: #valueChanged:) collect: [:methodRef | methodRef methodSymbol]).