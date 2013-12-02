*si-ob-morphic
signal

	^ Form
		fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self signalContents readStream)