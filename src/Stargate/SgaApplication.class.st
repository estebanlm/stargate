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

{ #category : #'standard dialogs' }
SgaApplication >> confirmTitle: titleString message: messageString [
	
	^ self 
		confirmTitle: titleString 
		message: messageString 
		relativeTo: self topWindow
]

{ #category : #'standard dialogs' }
SgaApplication >> confirmTitle: titleString message: messageString acceptLabel: acceptString cancelLabel: cancelLabel relativeTo: aWindowPresenter [
	| dialog |

	dialog := (SgaConfirmDialog newApplication: self)
		title: titleString;
		label: messageString;
		acceptLabel: acceptString;
		cancelLabel: cancelLabel;
		openDialogWithSpecParent: aWindowPresenter.
	
	^ dialog isOk
]

{ #category : #'standard dialogs' }
SgaApplication >> confirmTitle: titleString message: messageString relativeTo: aWindowPresenter [
	| dialog |

	dialog := (SgaConfirmDialog newApplication: self)
		title: titleString;
		label: messageString;
		openDialogWithSpecParent: aWindowPresenter.
	
	^ dialog isOk
]

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

{ #category : #'standard dialogs' }
SgaApplication >> requestTitle: titleString message: messageString [
		
	^ self 
		requestTitle: titleString 
		message: messageString 
		default: ''
]

{ #category : #'standard dialogs' }
SgaApplication >> requestTitle: titleString message: messageString default: defaultString [

	^ self 
		requestTitle: titleString 
		message: messageString 
		default: defaultString 
		relativeTo: self topWindow
]

{ #category : #'standard dialogs' }
SgaApplication >> requestTitle: titleString message: messageString default: defaultString relativeTo: aWindowPresenter [
	| dialog |

	dialog := (SgaRequestDialog newApplication: self)
		title: titleString;
		label: messageString;
		text: defaultString;
		openDialogWithSpecParent: aWindowPresenter.
	
	^ dialog isOk 
		ifTrue: [ dialog presenter text trimmed ]
		ifFalse: [ nil ]
]

{ #category : #'standard dialogs' }
SgaApplication >> requestTitle: titleString message: messageString relativeTo: aWindowPresenter [
	
	^ self 
		requestTitle: titleString 
		message: messageString 
		default: ''
		relativeTo: aWindowPresenter
]
