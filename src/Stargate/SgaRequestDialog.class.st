"
I am a simple dialog to request some information (a text)
"
Class {
	#name : #SgaRequestDialog,
	#superclass : #SgaPresenter,
	#instVars : [
		'label',
		'textInput',
		'title',
		'initialExtent',
		'acceptLabel',
		'cancelLabel'
	],
	#category : #'Stargate-Presenters'
}

{ #category : #accessing }
SgaRequestDialog class >> defaultAcceptLabel [

	^ 'Accept'
]

{ #category : #accessing }
SgaRequestDialog class >> defaultCancelLabel [

	^ 'Cancel'
]

{ #category : #accessing }
SgaRequestDialog class >> defaultExtent [

	^ 400@100
]

{ #category : #specs }
SgaRequestDialog class >> defaultSpec [

	^ SpBoxLayout newVertical
		borderWidth: 5;
		spacing: 5;
		add: #label expand: false;
		add: #textInput expand: false;
		yourself
]

{ #category : #accessing }
SgaRequestDialog >> acceptLabel [

	^ acceptLabel ifNil: [ self class defaultAcceptLabel ]
]

{ #category : #accessing }
SgaRequestDialog >> acceptLabel: aString [

	acceptLabel := aString
]

{ #category : #accessing }
SgaRequestDialog >> cancelLabel [

	^ cancelLabel ifNil: [ self class defaultCancelLabel ]
]

{ #category : #accessing }
SgaRequestDialog >> cancelLabel: aString [

	cancelLabel := aString
]

{ #category : #accessing }
SgaRequestDialog >> extent [

	^ initialExtent ifNil: [ self class defaultExtent ]
]

{ #category : #accessing }
SgaRequestDialog >> extent: aPoint [

	initialExtent := aPoint
]

{ #category : #initialization }
SgaRequestDialog >> initialize [
	
	super initialize.
	self title: 'Request'
]

{ #category : #initialization }
SgaRequestDialog >> initializeDialogWindow: aDialogWindowPresenter [

	super initializeDialogWindow: aDialogWindowPresenter.
	aDialogWindowPresenter
		addButton: self cancelLabel do: [ :presenter | presenter beCancel; close ];
		addDefaultButton: self acceptLabel do: [ :presenter | presenter beOk; close ]
]

{ #category : #initialization }
SgaRequestDialog >> initializePresenters [

	label := self newLabel.
	textInput := self newTextInput
]

{ #category : #initialization }
SgaRequestDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self title;
		initialExtent: self extent;
		whenOpenedDo: [ textInput takeKeyboardFocus ]
]

{ #category : #accessing }
SgaRequestDialog >> label: aString [

	label label: aString
]

{ #category : #api }
SgaRequestDialog >> openDialogWithSpec [
	| dialog |
	
	dialog := super openDialogWithSpec.
	^ dialog isOk
		ifTrue: [ self text trimmed ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
SgaRequestDialog >> text [ 
	
	^ textInput text trimmed
]

{ #category : #accessing }
SgaRequestDialog >> text: aString [

	textInput text: aString
]

{ #category : #accessing }
SgaRequestDialog >> title [

	^ title
]

{ #category : #accessing }
SgaRequestDialog >> title: aString [

	title := aString
]
