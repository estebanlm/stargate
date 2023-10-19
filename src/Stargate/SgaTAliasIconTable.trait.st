Trait {
	#name : 'SgaTAliasIconTable',
	#instVars : [
		'aliases'
	],
	#category : 'Stargate-IconProvider',
	#package : 'Stargate',
	#tag : 'IconProvider'
}

{ #category : 'accessing' }
SgaTAliasIconTable >> addAliasesFromPairs: aCollection [

	aCollection pairsDo: [ :aName :anAlias | 
		self aliasAt: aName put: anAlias ]
]

{ #category : 'accessing' }
SgaTAliasIconTable >> aliasAt: aName put: anAlias [

	self aliases 
		at: aName 
		put: anAlias
]

{ #category : 'accessing' }
SgaTAliasIconTable >> aliasFor: aName [

	^ self aliases
		at: aName
		ifAbsent: [ aName ]
]

{ #category : 'accessing' }
SgaTAliasIconTable >> aliases [

	^ aliases ifNil: [ aliases := SmallDictionary new ]
]

{ #category : 'accessing' }
SgaTAliasIconTable >> iconNamed: aName ifAbsent: aBlock [

	^ super 
		iconNamed: (self aliasFor: aName) 
		ifAbsent: aBlock
]
