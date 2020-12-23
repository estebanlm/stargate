Class {
	#name : #SgaKMCategoryMenuBuilder,
	#superclass : #Object,
	#instVars : [
		'kmCategory'
	],
	#category : #'Stargate-Visitors'
}

{ #category : #accessing }
SgaKMCategoryMenuBuilder class >> menuPresenterClass [
	^ SpMenuPresenter
]

{ #category : #initialization }
SgaKMCategoryMenuBuilder >> initialize [
	
	super initialize.
	kmCategory := KMCategory new
]

{ #category : #accessing }
SgaKMCategoryMenuBuilder >> kmCategory [

	^ kmCategory
]

{ #category : #visiting }
SgaKMCategoryMenuBuilder >> visitMenuGroupPresenter: aMenuGroupPresenter [

	aMenuGroupPresenter menuItems 
		do: [ :each | each accept: self ]
]

{ #category : #visiting }
SgaKMCategoryMenuBuilder >> visitMenuItemPresenter: aMenuItemPresenter [

	aMenuItemPresenter hasShortcut ifFalse: [ ^ self ].

	kmCategory addKeymapEntry: (KMKeymap
		shortcut: aMenuItemPresenter shortcut
		action: aMenuItemPresenter action).
		
	aMenuItemPresenter subMenu 
		ifNotNil: [ :subMenu | subMenu accept: self ]
]

{ #category : #visiting }
SgaKMCategoryMenuBuilder >> visitMenuPresenter: aMenuPresenter [

	aMenuPresenter menuGroups 
		do: [ :each | each accept: self ]
]
