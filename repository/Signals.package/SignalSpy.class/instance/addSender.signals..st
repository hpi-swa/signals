spying
addSender: aSender signals: someSignals

	someSignals do: [:signal |
		self addSender: aSender signal: signal].