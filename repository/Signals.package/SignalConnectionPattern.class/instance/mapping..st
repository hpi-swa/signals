accessing
mapping: anArray
	"#(1 2 3), #(1 2 =foobar), {#=. obj1. 2. 3}"

	mapping := anArray collect: [:each |
		({ByteString. ByteSymbol. SmallInteger} includes: each class)
			ifTrue: [each]
			ifFalse: [WeakArray with: each]]