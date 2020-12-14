Extension { #name : #KMKeyCombination }

{ #category : #'*Stargate' }
KMKeyCombination >> platformMeta [

	^ (KMModifier command + self) mac 
		| (KMModifier control + self) unix 
		| (KMModifier control + self) win
]
