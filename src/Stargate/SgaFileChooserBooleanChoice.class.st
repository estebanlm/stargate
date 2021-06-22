Class {
	#name : #SgaFileChooserBooleanChoice,
	#superclass : #SgaFileChooserChoice,
	#instVars : [
		'selected'
	],
	#category : #'Stargate-Utils'
}

{ #category : #adding }
SgaFileChooserBooleanChoice >> addTo: dialog [
	
	id := dialog addBooleanChoice: self label.
	self isSelected ifTrue: [ 
		dialog choiceAt: id option: 'true' ]
]

{ #category : #adding }
SgaFileChooserBooleanChoice >> getFrom: dialog [

	^ (dialog choiceAt: id) = 'true'
]

{ #category : #testing }
SgaFileChooserBooleanChoice >> isSelected [

	^ selected
]

{ #category : #accessing }
SgaFileChooserBooleanChoice >> selected: aBoolean [

	selected := aBoolean
]
