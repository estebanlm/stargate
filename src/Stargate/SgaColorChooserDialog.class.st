Class {
	#name : 'SgaColorChooserDialog',
	#superclass : 'SgaStandarDialog',
	#instVars : [
		'color'
	],
	#category : 'Stargate-Utils',
	#package : 'Stargate',
	#tag : 'Utils'
}

{ #category : 'accessing' }
SgaColorChooserDialog >> color: aColor [
	
	color := aColor
]

{ #category : 'private' }
SgaColorChooserDialog >> deferredRunWithParent: aWindowPresenter [

	self error: 'should not arrive here'
]

{ #category : 'api - showing' }
SgaColorChooserDialog >> openModalWithParent: aWindowPresenter [

	^ GtkColorDialog 
		chooseColorParent: (aWindowPresenter 
			ifNotNil: [ aWindowPresenter adapter widget ])
		title: title 
		initial: color
]
