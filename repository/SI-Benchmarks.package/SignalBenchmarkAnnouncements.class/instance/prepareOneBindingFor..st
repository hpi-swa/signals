as yet unclassified
prepareOneBindingFor: aReceiver

	announcer
		when: SignalBenchmarkAnnouncement
		do: [:announcement | aReceiver update: announcement value].
		