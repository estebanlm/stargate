Class {
	#name : #SgaConfirmDialog,
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
SgaConfirmDialog class >> defaultAcceptLabel [

	^ 'Yes'
]

{ #category : #accessing }
SgaConfirmDialog class >> defaultCancelLabel [

	^ 'No'
]

{ #category : #accessing }
SgaConfirmDialog class >> defaultExtent [

	^ 400@100
]

{ #category : #specs }
SgaConfirmDialog class >> defaultSpec [

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
SgaConfirmDialog >> acceptLabel [

	^ acceptLabel ifNil: [ self class defaultAcceptLabel ]
]

{ #category : #accessing }
SgaConfirmDialog >> acceptLabel: aString [

	acceptLabel := aString
]

{ #category : #accessing }
SgaConfirmDialog >> cancelLabel [

	^ cancelLabel ifNil: [ self class defaultCancelLabel ]
]

{ #category : #accessing }
SgaConfirmDialog >> cancelLabel: aString [

	cancelLabel := aString
]

{ #category : #accessing }
SgaConfirmDialog >> extent [

	^ initialExtent ifNil: [ self class defaultExtent ]
]

{ #category : #accessing }
SgaConfirmDialog >> extent: aPoint [

	initialExtent := aPoint
]

{ #category : #initialization }
SgaConfirmDialog >> initializeDialogWindow: aDialogWindowPresenter [

	super initializeDialogWindow: aDialogWindowPresenter.
	aDialogWindowPresenter
		addButton: self cancelLabel do: [ :presenter | presenter beCancel; close ];
		addDefaultButton: self acceptLabel do: [ :presenter | presenter beOk; close ]
		
]

{ #category : #initialization }
SgaConfirmDialog >> initializePresenters [

	image := self newImage.
	label := self newLabel.
	
]

{ #category : #initialization }
SgaConfirmDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self title;
		initialExtent: self extent
]

{ #category : #accessing }
SgaConfirmDialog >> label: aString [

	label label: aString
]

{ #category : #accessing }
SgaConfirmDialog >> title [

	^ title
]

{ #category : #accessing }
SgaConfirmDialog >> title: aString [

	title := aString
]
