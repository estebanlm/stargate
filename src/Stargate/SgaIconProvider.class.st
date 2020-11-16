"
A base icon provider. 
Children of `SgaIconProvider` will define concrete ways to access icons.
"
Class {
	#name : #SgaIconProvider,
	#superclass : #Object,
	#category : #'Stargate-IconProvider'
}

{ #category : #copying }
SgaIconProvider >> , aProvider [

	^ SgaCompositeIconProvider new 
		addProvider: self;
		addProvider: aProvider;
		yourself
]

{ #category : #accessing }
SgaIconProvider >> iconNamed: aName [

	^ self 
		iconNamed: aName 
		ifAbsent: [ self error: ('Icon {1} not found.' format: { aName })  ]
]

{ #category : #accessing }
SgaIconProvider >> iconNamed: aName ifAbsent: aBlock [

	self subclassResponsibility
]
