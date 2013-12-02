accessing
forceUiProcess
	"Process callback blocking if already in UI process, enqueue in WorldState>>deferredUIMessages in the other case."

	^ forceUiProcess