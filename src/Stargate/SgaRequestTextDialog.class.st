Class {
	#name : #SgaRequestTextDialog,
	#superclass : #SgaRequestDialog,
	#category : #'Stargate-Presenters'
}

{ #category : #accessing }
SgaRequestTextDialog class >> defaultExtent [

	^ 400@400
]

{ #category : #specs }
SgaRequestTextDialog class >> defaultSpec [

	^ SpBoxLayout newVertical
		borderWidth: 5;
		spacing: 5;
		add: #label expand: false;
		add: #textInput;
		yourself
]

{ #category : #initialization }
SgaRequestTextDialog >> initializePresenters [

	label := self newLabel.
	textInput := (self newText
		addStyle: 'monospaceFont';
		yourself)
]
