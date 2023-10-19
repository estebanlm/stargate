Class {
	#name : 'SgaFileChooserResult',
	#superclass : 'Object',
	#instVars : [
		'directory',
		'name',
		'choices'
	],
	#category : 'Stargate-Utils',
	#package : 'Stargate',
	#tag : 'Utils'
}

{ #category : 'accessing' }
SgaFileChooserResult >> choices [

	^ choices
]

{ #category : 'accessing' }
SgaFileChooserResult >> choices: anObject [

	choices := anObject
]

{ #category : 'accessing' }
SgaFileChooserResult >> directory [

	^ directory
]

{ #category : 'accessing' }
SgaFileChooserResult >> directory: anObject [

	directory := anObject
]

{ #category : 'accessing' }
SgaFileChooserResult >> fileReference [

	^ self directory asFileReference / self name
]

{ #category : 'accessing' }
SgaFileChooserResult >> name [

	^ name
]

{ #category : 'accessing' }
SgaFileChooserResult >> name: anObject [

	name := anObject
]
