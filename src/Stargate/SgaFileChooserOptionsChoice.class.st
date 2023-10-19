Class {
	#name : 'SgaFileChooserOptionsChoice',
	#superclass : 'SgaFileChooserChoice',
	#instVars : [
		'options',
		'selectedIndex'
	],
	#category : 'Stargate-Utils',
	#package : 'Stargate',
	#tag : 'Utils'
}

{ #category : 'adding' }
SgaFileChooserOptionsChoice >> addTo: dialog [
	
	id := dialog addChoice: self label options: self options.
	self selectedIndex ifNotNil: [ :index |
		dialog choiceAt: id option: index ]
]

{ #category : 'adding' }
SgaFileChooserOptionsChoice >> getFrom: dialog [
	| choosen |
	
	choosen := dialog choiceAt: id.
	^ choosen ifNotNil: [ self options at: choosen asNumber ]
]

{ #category : 'accessing' }
SgaFileChooserOptionsChoice >> options [

	^ options
]

{ #category : 'accessing' }
SgaFileChooserOptionsChoice >> options: anObject [

	options := anObject
]

{ #category : 'accessing' }
SgaFileChooserOptionsChoice >> selectedIndex [

	^ selectedIndex
]

{ #category : 'accessing' }
SgaFileChooserOptionsChoice >> selectedIndex: anObject [

	selectedIndex := anObject
]
