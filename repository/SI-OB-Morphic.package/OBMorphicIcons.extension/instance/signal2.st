*si-ob-morphic
signal2

	^ Form
		fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self signal2Contents readStream)