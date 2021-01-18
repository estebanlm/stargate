Class {
	#name : #SgaSelectDialog,
	#superclass : #SgaPresenter,
	#instVars : [
		'label',
		'title',
		'initialExtent',
		'acceptLabel',
		'cancelLabel',
		'list'
	],
	#category : #'Stargate-Presenters'
}

{ #category : #accessing }
SgaSelectDialog class >> defaultAcceptLabel [

	^ 'Accept'
]

{ #category : #accessing }
SgaSelectDialog class >> defaultCancelLabel [

	^ 'Cancel'
]

{ #category : #accessing }
SgaSelectDialog class >> defaultExtent [

	^ 400@300
]

{ #category : #specs }
SgaSelectDialog class >> defaultSpec [

	^ SpBoxLayout newVertical
		borderWidth: 5;
		spacing: 5;
		add: #label expand: false;
		add: #list;
		yourself
]

{ #category : #accessing }
SgaSelectDialog >> acceptLabel [

	^ acceptLabel ifNil: [ self class defaultAcceptLabel ]
]

{ #category : #accessing }
SgaSelectDialog >> acceptLabel: aString [

	acceptLabel := aString
]

{ #category : #accessing }
SgaSelectDialog >> cancelLabel [

	^ cancelLabel ifNil: [ self class defaultCancelLabel ]
]

{ #category : #accessing }
SgaSelectDialog >> cancelLabel: aString [

	cancelLabel := aString
]

{ #category : #accessing }
SgaSelectDialog >> display: aBlock [

	list display: aBlock
]

{ #category : #accessing }
SgaSelectDialog >> displayIcon: aBlock [

	list displayIcon: aBlock
]

{ #category : #accessing }
SgaSelectDialog >> extent [

	^ initialExtent ifNil: [ self class defaultExtent ]
]

{ #category : #accessing }
SgaSelectDialog >> extent: aPoint [

	initialExtent := aPoint
]

{ #category : #initialization }
SgaSelectDialog >> initialize [
	
	super initialize.
	self title: 'Request'
]

{ #category : #initialization }
SgaSelectDialog >> initializeDialogWindow: aDialogWindowPresenter [

	super initializeDialogWindow: aDialogWindowPresenter.
	aDialogWindowPresenter
		addButton: self cancelLabel do: [ :presenter | presenter beCancel; close ];
		addDefaultButton: self acceptLabel do: [ :presenter | presenter beOk; close ]
]

{ #category : #initialization }
SgaSelectDialog >> initializePresenters [

	label := self newLabel.
	list := self newList.
	
	list addStyle: 'sgaSelectList'.
	list whenActivatedDo: [ self window triggerOkAction ]
]

{ #category : #initialization }
SgaSelectDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self title;
		initialExtent: self extent;
		whenOpenedDo: [ list takeKeyboardFocus ]
]

{ #category : #accessing }
SgaSelectDialog >> items [

	^ list items
]

{ #category : #accessing }
SgaSelectDialog >> items: aCollection [

	list items: aCollection
]

{ #category : #accessing }
SgaSelectDialog >> label: aString [

	label label: aString
]

{ #category : #api }
SgaSelectDialog >> openDialogWithSpec [
	| dialog |
	
	dialog := super openDialogWithSpec.
	^ dialog isOk
		ifTrue: [ list selectedItem ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
SgaSelectDialog >> title [

	^ title
]

{ #category : #accessing }
SgaSelectDialog >> title: aString [

	title := aString
]
