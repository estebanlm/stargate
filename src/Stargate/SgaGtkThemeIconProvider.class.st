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
	icon := GRunLoop defer: [ 
		GtkImage loadFromThemeIconNamed: aName size: 16 ].
	icon ifNil: [ ^ aBlock value ].
	^ icon
]
