Class {
	#name : 'SgaFileChooserChoice',
	#superclass : 'Object',
	#instVars : [
		'label',
		'id'
	],
	#category : 'Stargate-Utils',
	#package : 'Stargate',
	#tag : 'Utils'
}

{ #category : 'adding' }
SgaFileChooserChoice >> addTo: dialog [
	
	self subclassResponsibility
]

{ #category : 'adding' }
SgaFileChooserChoice >> getFrom: dialog [

	self subclassResponsibility
]

{ #category : 'accessing' }
SgaFileChooserChoice >> id [

	^ id
]

{ #category : 'accessing' }
SgaFileChooserChoice >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
SgaFileChooserChoice >> label [

	^ label
]

{ #category : 'accessing' }
SgaFileChooserChoice >> label: anObject [

	label := anObject
]
