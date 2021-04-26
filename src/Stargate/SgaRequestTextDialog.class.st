Class {
	#name : #SgaRequestTextDialog,
	#superclass : #SpRequestTextDialog,
	#category : #'Stargate-Presenters'
}

{ #category : #initialization }
SgaRequestTextDialog >> initializePresenters [

	super initializePresenters.
	textInput addStyle: 'monospaceFont'
]
