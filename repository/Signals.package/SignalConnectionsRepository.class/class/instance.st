instance
instance

	^ Repository ifNil: [Repository := self new. WeakArray addWeakDependent: Repository. Repository]