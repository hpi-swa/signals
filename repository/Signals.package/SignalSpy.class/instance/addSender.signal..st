spying
addSender: aSender signal: aSignal

	[self
		connect: aSender
		signal: aSignal
		toSelector: aSignal] forkAndWait. "Avoid processing of signals in UI process."