"
I am a base presenter for the Crono project. 
I define common behaviour for all Crono windows and panels, such as: 

- save/retrieve window configurations.
- configure the window with the common parameters.
- apply window keybindings
- apply window toolbar/menu actions
"
Class {
	#name : #SgaPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'#parentWindow => WeakSlot'
	],
	#category : #'Stargate-Presenters'
}

{ #category : #'instance creation' }
SgaPresenter class >> open [
	<script>
	
	^ self new openWithSpec
]

{ #category : #'instance creation' }
SgaPresenter class >> openDialog [
	<script>
	
	^ self new openDialogWithSpec
]

{ #category : #initialization }
SgaPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	self parentWindow 
		ifNotNil: [ :w | aDialogWindowPresenter centeredRelativeTo: w ] 
		ifNil: [ aDialogWindowPresenter centered ]
]

{ #category : #initialization }
SgaPresenter >> initializeWindow: aWindowPresenter [

	self traversePresentersDo: [ :each |
		each addGlobalShortcutsTo: aWindowPresenter ]
]

{ #category : #api }
SgaPresenter >> openDialogWithParent: aWindow [
	
	parentWindow := aWindow.
	^ self openDialog
]

{ #category : #api }
SgaPresenter >> openModalWithParent: aWindow [
	
	parentWindow := aWindow.
	^ self openModal
]

{ #category : #accessing }
SgaPresenter >> parentWindow [

	^ parentWindow
]
