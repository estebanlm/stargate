"
I am a base presenter for the Crono project. 
I define common behaviour for all Crono windows and panels, such as: 

- save/retrieve window configurations.
- configure the window with the common parameters.
- apply window keybindings
- apply window toolbar/menu actions
"
Class {
	#name : 'SgaPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'#parentWindow => WeakSlot'
	],
	#category : 'Stargate-Presenters',
	#package : 'Stargate',
	#tag : 'Presenters'
}

{ #category : 'instance creation' }
SgaPresenter class >> open [
	<script>
	
	^ self new open
]

{ #category : 'instance creation' }
SgaPresenter class >> openDialog [
	<script>
	
	^ self new openDialog
]

{ #category : 'initialization' }
SgaPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	self parentWindow 
		ifNotNil: [ :w | aDialogWindowPresenter centeredRelativeTo: w ] 
		ifNil: [ aDialogWindowPresenter centered ]
]

{ #category : 'initialization' }
SgaPresenter >> initializeWindow: aWindowPresenter [

	self traversePresentersDo: [ :each |
		each addGlobalActionsTo: aWindowPresenter ]
]

{ #category : 'api' }
SgaPresenter >> openDialogWithParent: aWindow [
	
	parentWindow := aWindow.
	^ self openDialog
]

{ #category : 'api' }
SgaPresenter >> openModalWithParent: aWindow [
	
	parentWindow := aWindow.
	^ self openModal
]

{ #category : 'accessing' }
SgaPresenter >> parentWindow [

	^ parentWindow
]
