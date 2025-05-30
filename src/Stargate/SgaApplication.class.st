"
A base application for gtk-backend based spec applications.
It provides different common services for any application: 

- notification center
- standalone execution
- access to resources (like icons)
- MORE TO COME
"
Class {
	#name : 'SgaApplication',
	#superclass : 'SpApplication',
	#traits : 'SgaTApplication',
	#classTraits : 'SgaTApplication classTrait',
	#instVars : [
		'standalone',
		'sgaNotificationCenter'
	],
	#category : 'Stargate-Application',
	#package : 'Stargate',
	#tag : 'Application'
}

{ #category : 'initialization' }
SgaApplication >> exitApplication [

	Smalltalk exitSuccess
]

{ #category : 'initialization' }
SgaApplication >> initialize [

	super initialize.
	self initializeBackend.
	self initializeModel
]

{ #category : 'initialization' }
SgaApplication >> initializeBackend [
]

{ #category : 'initialization' }
SgaApplication >> initializeModel [
]

{ #category : 'testing' }
SgaApplication >> isStandalone [

	^ standalone ifNil: [ standalone := false ]
]

{ #category : 'standard dialogs' }
SgaApplication >> newColorChooser [

	^ SgaColorChooserDialog newApplication: self
]

{ #category : 'standard dialogs' }
SgaApplication >> newFileChooser [

	^ SgaFileChooserDialog newApplication: self
]

{ #category : 'private factory' }
SgaApplication >> newNotificationCenter [

	^ SgaNotificationCenter new
]

{ #category : 'standard dialogs' }
SgaApplication >> newRequestText [

	^ SgaRequestTextDialog newApplication: self
]

{ #category : 'accessing' }
SgaApplication >> notificationCenter [

	^ sgaNotificationCenter ifNil: [ sgaNotificationCenter := self newNotificationCenter ]
]

{ #category : 'testing' }
SgaApplication >> shouldExitWhenNoMoreWindows [

	^ true
]

{ #category : 'private' }
SgaApplication >> verifyPossibleExit [

	self windows ifNotEmpty: [ ^ self ].
	self isStandalone ifFalse: [ ^ self ].
	self shouldExitWhenNoMoreWindows ifFalse: [ ^ self ].
	self exitApplication
]
