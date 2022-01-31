Class {
	#name : #SgaFileChooserDialog,
	#superclass : #Object,
	#instVars : [
		'application',
		'type',
		'title',
		'acceptLabel',
		'cancelLabel',
		'choices',
		'currentName',
		'overrideConfirmation',
		'currentFolder'
	],
	#pools : [
		'GtkFileChooserAction',
		'GtkResponseType'
	],
	#category : #'Stargate-Utils'
}

{ #category : #accessing }
SgaFileChooserDialog class >> defaultAcceptLabel [

	^ 'Accept'
]

{ #category : #accessing }
SgaFileChooserDialog class >> defaultCancelLabel [

	^ 'Cancel'
]

{ #category : #accessing }
SgaFileChooserDialog class >> defaultTitle [

	^ 'Open...'
]

{ #category : #examples }
SgaFileChooserDialog class >> example [ 

	^ (self newApplication: (SpApplication new useBackend: #Gtk))
		beSave;
		title: 'Export as...'; 
		acceptLabel: 'Export';
		overrideConfirmation: true;
		addChoice: 'Format' 
			options: #('pdf' 'odt' 'docx' 'epub' 'html') 
			selectedIndex: 1; 
		addBooleanChoice: 'Open exported document' default: true;
		currentName: 'test';
		openModal.

]

{ #category : #'instance creation' }
SgaFileChooserDialog class >> newApplication: anApplication [

	^ self new 
		application: anApplication;
		yourself
]

{ #category : #accessing }
SgaFileChooserDialog >> acceptLabel [

	^ acceptLabel
]

{ #category : #accessing }
SgaFileChooserDialog >> acceptLabel: anObject [

	acceptLabel := anObject
]

{ #category : #accessing }
SgaFileChooserDialog >> addBooleanChoice: aLabel [
	"a boolean choice"
	
	self addBooleanChoice: aLabel default: false
]

{ #category : #accessing }
SgaFileChooserDialog >> addBooleanChoice: aLabel default: aBoolean [
	"a boolean choice"
	
	choices add: (SgaFileChooserBooleanChoice new 
		label: aLabel;
		selected: aBoolean;
		yourself) 
]

{ #category : #accessing }
SgaFileChooserDialog >> addChoice: aLabel options: optionsArray [

	^ self 
		addChoice: aLabel 
		options: optionsArray	
		selectedIndex: nil
	
	
]

{ #category : #accessing }
SgaFileChooserDialog >> addChoice: aLabel options: optionsArray selectedIndex: index [

	choices add: (SgaFileChooserOptionsChoice new 
		label: aLabel;
		options: optionsArray;
		selectedIndex: index;
		yourself)
]

{ #category : #accessing }
SgaFileChooserDialog >> application [

	^ application
]

{ #category : #accessing }
SgaFileChooserDialog >> application: anObject [

	application := anObject
]

{ #category : #accessing }
SgaFileChooserDialog >> beSave [

	self type: GTK_FILE_CHOOSER_ACTION_SAVE
]

{ #category : #accessing }
SgaFileChooserDialog >> cancelLabel [

	^ cancelLabel
]

{ #category : #accessing }
SgaFileChooserDialog >> cancelLabel: anObject [

	cancelLabel := anObject
]

{ #category : #accessing }
SgaFileChooserDialog >> choices [

	^ choices
]

{ #category : #accessing }
SgaFileChooserDialog >> currentFolder [

	^ currentFolder
]

{ #category : #accessing }
SgaFileChooserDialog >> currentFolder: aString [

	currentFolder := aString
]

{ #category : #accessing }
SgaFileChooserDialog >> currentName [

	^ currentName
]

{ #category : #accessing }
SgaFileChooserDialog >> currentName: aString [

	currentName := aString
]

{ #category : #private }
SgaFileChooserDialog >> deferredRunWithParent: aWindowPresenter [
	| choosenFile dialog result |

	dialog := GtkFileChooserDialog 
		newTitle: self title
		action: self type
		acceptLabel: self acceptLabel
		cancelLabel: self cancelLabel. 

	choices do: [ :aChoice | aChoice addTo: dialog ].
	dialog overrideConfirmation: self isOverrideConfirmation.
	self currentFolder ifNotNil: [ :aString | dialog currentFolder: aString ].
	self currentName ifNotNil: [ :aString | dialog currentName: aString ].

	aWindowPresenter ifNotNil: [ 
		dialog transientTo: aWindowPresenter adapter widget ].
	dialog show.
	result := dialog run.
	result = GTK_RESPONSE_OK ifTrue: [ 
		choosenFile := SgaFileChooserResult new 
			directory: dialog currentFolder;
			name: dialog currentName;
			choices: (choices collect: [ :each | each getFrom: dialog ]);
			yourself ].

	^ choosenFile
]

{ #category : #initialization }
SgaFileChooserDialog >> initialize [

	super initialize.
	self type: GTK_FILE_CHOOSER_ACTION_OPEN.
	self title: self class defaultTitle.
	self acceptLabel: self class defaultAcceptLabel.
	self cancelLabel: self class defaultCancelLabel.
	overrideConfirmation := true.
	choices := OrderedCollection new: 1
]

{ #category : #testing }
SgaFileChooserDialog >> isOverrideConfirmation [

	^ overrideConfirmation
]

{ #category : #'api - showing' }
SgaFileChooserDialog >> openModal [

	^ self openModalWithParent: nil
]

{ #category : #'api - showing' }
SgaFileChooserDialog >> openModalWithParent: aWindowPresenter [

	^ GRunLoop defer: [ self deferredRunWithParent: aWindowPresenter ]
]

{ #category : #accessing }
SgaFileChooserDialog >> overrideConfirmation: anObject [

	overrideConfirmation := anObject
]

{ #category : #accessing }
SgaFileChooserDialog >> title [

	^ title
]

{ #category : #accessing }
SgaFileChooserDialog >> title: anObject [

	title := anObject
]

{ #category : #accessing }
SgaFileChooserDialog >> type [

	^ type
]

{ #category : #private }
SgaFileChooserDialog >> type: anObject [

	type := anObject
]
