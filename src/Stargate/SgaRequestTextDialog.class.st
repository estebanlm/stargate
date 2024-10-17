Class {
	#name : 'SgaRequestTextDialog',
	#superclass : 'SpRequestTextDialog',
	#category : 'Stargate-Presenters',
	#package : 'Stargate',
	#tag : 'Presenters'
}

{ #category : 'initialization' }
SgaRequestTextDialog >> connectPresenters [ 
	
]

{ #category : 'initialization' }
SgaRequestTextDialog >> initializePresenters [

	super initializePresenters.
	textInput := self newText.
	textInput addStyle: 'monospaceFont'
]
