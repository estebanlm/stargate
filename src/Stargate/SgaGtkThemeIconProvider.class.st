Class {
	#name : 'SgaGtkThemeIconProvider',
	#superclass : 'SpIconProvider',
	#category : 'Stargate-IconProvider',
	#package : 'Stargate',
	#tag : 'IconProvider'
}

{ #category : 'accessing' }
SgaGtkThemeIconProvider >> iconNamed: aName ifAbsent: aBlock [
	| icon |

	aName ifNil: [ ^ aBlock value ].
	icon := GRunLoop defer: [ GtkImage newIconName: aName asString ].
	icon isNull ifTrue: [ ^ aBlock value ].
	^ icon
]
