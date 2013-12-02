testing
test01FindConnections

	self
		assert: #(test03 test15 test17 test19 test28 test29 test30 test31 test32 test33) asOrderedCollection
		equals: ((SystemNavigation default
			allConnectionsOn: #newSignalProduced
			from: SignalTest) collect: [:methodRef | (methodRef methodSymbol first: 6) asSymbol]) sorted.