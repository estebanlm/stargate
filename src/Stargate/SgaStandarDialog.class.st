Class {
	#name : #SgaStandarDialog,
	#superclass : #Object,
	#instVars : [
		'application',
		'title'
	],
	#pools : [
		'GtkResponseType'
	],
	#category : #'Stargate-Utils'
}

{ #category : #accessing }
SgaStandarDialog class >> defaultTitle [

	^ 'Untitled'
]

{ #category : #'instance creation' }
SgaStandarDialog class >> newApplication: anApplication [

	^ self new 
		application: anApplication;
		yourself
]

{ #category : #accessing }
SgaStandarDialog >> application [

	^ application
]

{ #category : #accessing }
SgaStandarDialog >> application: anApplication [

	application := anApplication
]

{ #category : #private }
SgaStandarDialog >> deferredRunWithParent: aWindowPresenter [

	self subclassResponsibility
]

{ #category : #initialization }
SgaStandarDialog >> initialize [

	super initialize.
	self title: self class defaultTitle.
]

{ #category : #'api - showing' }
SgaStandarDialog >> openModal [

	^ self openModalWithParent: nil
]

{ #category : #'api - showing' }
SgaStandarDialog >> openModalWithParent: aWindowPresenter [

	^ GRunLoop defer: [ self deferredRunWithParent: aWindowPresenter ]
]

{ #category : #accessing }
SgaStandarDialog >> title [

	^ title
]

{ #category : #accessing }
SgaStandarDialog >> title: aString [

	title := aString
]
