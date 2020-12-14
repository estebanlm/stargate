Class {
	#name : #SgaInformDialog,
	#superclass : #SgaPresenter,
	#instVars : [
		'label',
		'image',
		'title',
		'initialExtent',
		'acceptLabel',
		'cancelLabel'
	],
	#category : #'Stargate-Presenters'
}

{ #category : #accessing }
SgaInformDialog class >> defaultAcceptLabel [

	^ 'Ok'
]

{ #category : #accessing }
SgaInformDialog class >> defaultExtent [

	^ 400@100
]

{ #category : #specs }
SgaInformDialog class >> defaultSpec [

	^ SpBoxLayout newVertical
		borderWidth: 5;
		spacing: 5;
		add: (SpBoxLayout newHorizontal
			spacing: 5;
			add: #image expand: false;
			add: #label;
			yourself);
		yourself
]

{ #category : #accessing }
SgaInformDialog >> acceptLabel [

	^ acceptLabel ifNil: [ self class defaultAcceptLabel ]
]

{ #category : #accessing }
SgaInformDialog >> acceptLabel: aString [

	acceptLabel := aString
]

{ #category : #accessing }
SgaInformDialog >> extent [

	^ initialExtent ifNil: [ self class defaultExtent ]
]

{ #category : #accessing }
SgaInformDialog >> extent: aPoint [

	initialExtent := aPoint
]

{ #category : #initialization }
SgaInformDialog >> initialize [

	super initialize.
	self title: 'Inform'
]

{ #category : #initialization }
SgaInformDialog >> initializeDialogWindow: aDialogWindowPresenter [

	super initializeDialogWindow: aDialogWindowPresenter.
	aDialogWindowPresenter
		addDefaultButton: self acceptLabel do: [ :presenter | presenter beOk; close ]
		
]

{ #category : #initialization }
SgaInformDialog >> initializePresenters [

	image := self newImage.
	label := self newLabel.
	
]

{ #category : #initialization }
SgaInformDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self title;
		initialExtent: self extent
]

{ #category : #accessing }
SgaInformDialog >> label: aString [

	label label: aString
]

{ #category : #accessing }
SgaInformDialog >> title [

	^ title
]

{ #category : #accessing }
SgaInformDialog >> title: aString [

	title := aString
]
