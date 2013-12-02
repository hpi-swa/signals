as yet unclassified
prepareOneBindingFor: aReceiver

	aReceiver
		connect: sender
		signal: #value2:
		toSelector: #update: