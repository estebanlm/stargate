"
A composite icon provider.
Users can compose icon providers to define different ways to find icons.
A tipical usage would be: 

```
(SgaLocationIconProvider newLocation: './icons'), SgaGtkThemeIconProvider new
```
"
Class {
	#name : #SgaCompositeIconProvider,
	#superclass : #SgaIconProvider,
	#instVars : [
		'providers'
	],
	#category : #'Stargate-IconProvider'
}

{ #category : #copying }
SgaCompositeIconProvider >> , aProvider [

	self addProvider: aProvider.
	^ self
]

{ #category : #accessing }
SgaCompositeIconProvider >> addProvider: anIconProvider [

	providers := providers copyWith: anIconProvider
]

{ #category : #accessing }
SgaCompositeIconProvider >> iconNamed: aName ifAbsent: aBlock [

	self providers do: [ :each |
		(each iconNamed: aName ifAbsent: [ nil ]) 
			ifNotNil: [ :icon | ^ icon ] ].
	
	^ aBlock value
]

{ #category : #initialization }
SgaCompositeIconProvider >> initialize [

	super initialize.
	providers := #()
]

{ #category : #accessing }
SgaCompositeIconProvider >> providers [
	
	^ providers
]
