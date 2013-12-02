as yet unclassified
run

	SignalBenchmark subclassesDo: [:benchmark |
		self run: benchmark].
	
	^ results