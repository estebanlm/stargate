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
		'standalone',
		'iconProvider'
	],
	#classVars : [
		'Current'
	],
	#category : #'Stargate-Application'
}

{ #category : #'accessing resources' }
SgaApplication >> iconNamed: aString [

	^ self iconProvider iconNamed: aString
]

{ #category : #'accessing resources' }
SgaApplication >> iconProvider [

	^ iconProvider ifNil: [ iconProvider := self newIconProvider ]
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
SgaApplication >> newIconProvider [

	^ SgaPharoThemeIconProvider new
]

{ #category : #'private factory' }
SgaApplication >> newNotificationCenter [

	^ SgaNotificationCenter new
]

{ #category : #accessing }
SgaApplication >> notificationCenter [

	^ notificationCenter ifNil: [ notificationCenter := self newNotificationCenter ]
]

{ #category : #initialization }
SgaApplication >> prepareAsStandaloneApplication [
	
	standalone := true
]
