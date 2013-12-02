as yet unclassified
prepareOneBindingFor: aReceiver

	sender
		when: #valueChanged
		send: #update:
		to: aReceiver.