Class {
	#name : #SgaColorChooserDialog,
	#superclass : #SgaStandarDialog,
	#instVars : [
		'palette',
		'paletteLineSize',
		'color',
		'horizontal'
	],
	#category : #'Stargate-Utils'
}

{ #category : #accessing }
SgaColorChooserDialog >> beHorizontal [

	horizontal := true
]

{ #category : #accessing }
SgaColorChooserDialog >> beVertical [

	horizontal := false
]

{ #category : #accessing }
SgaColorChooserDialog >> color: aColor [
	
	color := aColor
]

{ #category : #private }
SgaColorChooserDialog >> deferredRunWithParent: aWindowPresenter [
	| dialog result |

	dialog := aWindowPresenter 
		ifNotNil: [ GtkColorChooserDialog newTitle: self title parent: aWindowPresenter adapter widget ]
		ifNil: [ GtkColorChooserDialog newTitle: self title ].

	color ifNotNil: [ 
		dialog color: color ].
	palette ifNotNil: [  
		horizontal 
			ifTrue: [ dialog addHorizontalPalette: palette lineSize: paletteLineSize ]
			ifFalse: [ dialog addVerticalPalette: palette lineSize: paletteLineSize ] ].

	dialog show.
	result := dialog run.
	^ result = GTK_RESPONSE_OK 
		ifTrue: [ dialog color ]
		ifFalse: [ nil ]
]

{ #category : #initialization }
SgaColorChooserDialog >> initialize [

	super initialize.
	horizontal := true
]

{ #category : #accessing }
SgaColorChooserDialog >> palette: colors size: line [

	palette := colors.
	paletteLineSize := line
]
