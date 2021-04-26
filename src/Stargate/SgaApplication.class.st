"
A base application for gtk-backend based spec applications.
It provides different common services for any application: 

- notification center
- standalone execution
- access to resources (like icons)
- MORE TO COME
"
Class {
	#name : #SgaApplication,
	#superclass : #SpApplication,
	#instVars : [
		'notificationCenter',
		'standalone'
	],
	#classVars : [
		'Current'
	],
	#category : #'Stargate-Application'
}

{ #category : #initialization }
SgaApplication >> exitApplication [

	Smalltalk exitSuccess
]

{ #category : #initialization }
SgaApplication >> initialize [

	super initialize.
	self initializeBackend.
	self initializeModel
]

{ #category : #initialization }
SgaApplication >> initializeBackend [
]

{ #category : #initialization }
SgaApplication >> initializeModel [
]

{ #category : #testing }
SgaApplication >> isStandalone [

	^ standalone ifNil: [ standalone := false ]
]

{ #category : #'private factory' }
SgaApplication >> newNotificationCenter [

	^ SgaNotificationCenter new
]

{ #category : #'standard dialogs' }
SgaApplication >> newRequestText [

	^ SgaRequestTextDialog newApplication: self
]

{ #category : #accessing }
SgaApplication >> notificationCenter [

	^ notificationCenter ifNil: [ notificationCenter := self newNotificationCenter ]
]

{ #category : #initialization }
SgaApplication >> prepareAsStandaloneApplication [
	
	standalone := true
]

{ #category : #testing }
SgaApplication >> shouldExitWhenNoMoreWindows [

	^ true
]

{ #category : #private }
SgaApplication >> unregisterWindow: aWindow [

	super unregisterWindow: aWindow.
	self verifyPossibleExit
]

{ #category : #private }
SgaApplication >> verifyPossibleExit [

	self windows ifNotEmpty: [ ^ self ].
	self isStandalone ifFalse: [ ^ self ].
	self shouldExitWhenNoMoreWindows ifFalse: [ ^ self ].
	self exitApplication
]
