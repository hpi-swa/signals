A helper class to catch transcript outputs.

Usage:

| stm |
stm := SignalTranscriptModel new.
stm register.

Transcript show: #foobar.

self assert: #appendEntry equals: stm lastUpdate.
self assert: #foobar equals: stm lastEntry.

stm unregister.