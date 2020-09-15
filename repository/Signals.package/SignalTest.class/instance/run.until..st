private
run: aProcess until: conditionBlock
	"Simulate code execution until the provided condition is fulfilled. Copied from Process >> #runUntil: for backward compatibility."

	[(conditionBlock isNil
		or: [aProcess isTerminated])
		or: [conditionBlock value: aProcess suspendedContext]
	] whileFalse: [aProcess step].

	"If we are already at a send, this next call should do nothing."
	aProcess stepToSendOrReturn.