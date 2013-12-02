as yet unclassified
prepareOneBindingFor: aReceiver

	aReceiver
		connect: sender
		signal: #valueChanged:
		toSelector: #update: