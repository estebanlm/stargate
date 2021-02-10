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

{ #category : #'standard dialogs' }
SgaApplication >> newConfirm [

	^ SgaConfirmDialog newApplication: self
]

{ #category : #'standard dialogs' }
SgaApplication >> newInform [

	^ SgaInformDialog newApplication: self
]

{ #category : #'private factory' }
SgaApplication >> newNotificationCenter [

	^ SgaNotificationCenter new
]

{ #category : #'standard dialogs' }
SgaApplication >> newRequest [

	^ SgaRequestDialog newApplication: self
]

{ #category : #'standard dialogs' }
SgaApplication >> newSelect [

	^ SgaSelectDialog newApplication: self
]

{ #category : #accessing }
SgaApplication >> notificationCenter [

	^ notificationCenter ifNil: [ notificationCenter := self newNotificationCenter ]
]

{ #category : #initialization }
SgaApplication >> prepareAsStandaloneApplication [
	
	standalone := true
]
