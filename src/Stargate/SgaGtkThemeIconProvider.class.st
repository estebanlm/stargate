Class {
	#name : #SgaGtkThemeIconProvider,
	#superclass : #SpIconProvider,
	#category : #'Stargate-IconProvider'
}

{ #category : #accessing }
SgaGtkThemeIconProvider >> iconNamed: aName ifAbsent: aBlock [
	| icon |

	aName ifNil: [ ^ aBlock value ].
	icon := GRunLoop defer: [ GtkImage newIconForButtonNamed: aName asString ].
	icon isNull ifTrue: [ ^ aBlock value ].
	^ icon
]
