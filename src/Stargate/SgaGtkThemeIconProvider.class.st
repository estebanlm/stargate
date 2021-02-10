Class {
	#name : #SgaGtkThemeIconProvider,
	#superclass : #SpIconProvider,
	#category : #'Stargate-IconProvider'
}

{ #category : #accessing }
SgaGtkThemeIconProvider >> iconNamed: aName ifAbsent: aBlock [
	| icon |

	icon := GtkRunLoop defer: [ GtkImage newIconForButtonNamed: aName asString ].
	icon isNull ifTrue: [ ^ aBlock value ].
	^ icon
]
