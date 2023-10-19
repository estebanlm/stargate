Class {
	#name : 'SgaRequestTextDialog',
	#superclass : 'SpRequestTextDialog',
	#category : 'Stargate-Presenters',
	#package : 'Stargate',
	#tag : 'Presenters'
}

{ #category : 'initialization' }
SgaRequestTextDialog >> initializePresenters [

	super initializePresenters.
	textInput addStyle: 'monospaceFont'
]
