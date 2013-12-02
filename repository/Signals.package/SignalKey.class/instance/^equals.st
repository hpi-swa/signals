comparing
= anotherKey

	^ (anotherKey class = self class
		and: [self theClass = anotherKey theClass])
		and: [self selector = anotherKey selector]