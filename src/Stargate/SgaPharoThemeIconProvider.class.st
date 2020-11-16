Class {
	#name : #SgaPharoThemeIconProvider,
	#superclass : #SgaIconProvider,
	#category : #'Stargate-IconProvider'
}

{ #category : #accessing }
SgaPharoThemeIconProvider >> iconNamed: aName ifAbsent: aBlock [

	^ ThemeIcons current 
		iconNamed: aName 
		ifNone: aBlock
]
