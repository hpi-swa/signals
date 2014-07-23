tests
test01Connect

	sut sgConnectSignal: #valueChanged: toSelector: #value.
	self
		assert: (sut signalConnectionsForOwnerChain includesKey: #valueChanged:);
		assert: 1 equals: (sut signalConnectionsForOwnerChain at: #valueChanged:) size.