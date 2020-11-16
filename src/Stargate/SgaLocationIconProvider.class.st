"
Provide access to icons from the system. 
It receive locations (directory references) where to find them. 
Alternatively, it can also look for gtk theme icons (stored by name in the gtk theme).
"
Class {
	#name : #SgaLocationIconProvider,
	#superclass : #SgaIconProvider,
	#instVars : [
		'icons',
		'locations'
	],
	#category : #'Stargate-IconProvider'
}

{ #category : #'instance creation' }
SgaLocationIconProvider class >> newLocation: aLocation [

	^ self new 
		addLocation: aLocation;
		yourself
]

{ #category : #accessing }
SgaLocationIconProvider >> addLocation: aReference [

	locations := locations copyWith: aReference
]

{ #category : #accessing }
SgaLocationIconProvider >> iconNamed: aName ifAbsent: aBlock [
	| icon |

	icon := icons at: aName ifAbsent: [ nil ].
	icon ifNil: [ 
		icon := self loadIconNamed: aName.
		icon ifNil: [ ^ aBlock value ].
		icons at: aName put: icon ].

	^ icon
]

{ #category : #accessing }
SgaLocationIconProvider >> icons [

	^ icons
]

{ #category : #initialization }
SgaLocationIconProvider >> initialize [ 

	super initialize.
	locations := #().
	icons := Dictionary new.
	icons at: #blank put: (Form extent: 16@16 depth: 8)
]

{ #category : #inspecting }
SgaLocationIconProvider >> inspectionIcons [
	<inspectorPresentationOrder: 0 title: 'Icons'> 

	^ SpListPresenter new
		items: (icons associations sorted: [ :a :b | a key < b key ]);
		icon: [ :each | each value ];
		display: [ :each | each key ];
		yourself
]

{ #category : #utils }
SgaLocationIconProvider >> loadAllIcons [

	self locations do: [ :eachLocation |
		(eachLocation filesMatching: '*.png') do: [ :each |
			icons 
				at: each basename
				put: (self loadIcon: each) ] ]
]

{ #category : #utils }
SgaLocationIconProvider >> loadIcon: fileRef [

	fileRef exists ifFalse: [ 
		self error: ('Icon {1} does not exit' format: { fileRef fullName }) ].

	^ fileRef binaryReadStreamDo: [ :stream |
		 Form fromBinaryStream: stream ]
]

{ #category : #utils }
SgaLocationIconProvider >> loadIconNamed: aSymbol [

	self locations do: [ :each | | ref |
		ref := (each / aSymbol) withExtension: 'png'.
		ref exists ifTrue: [ 
			^ self loadIcon: ref ] ].
	^ nil
]

{ #category : #accessing }
SgaLocationIconProvider >> locations [

	^ locations
]

{ #category : #accessing }
SgaLocationIconProvider >> menuIconNamed: aName [ 

	^ self iconNamed: aName
]
