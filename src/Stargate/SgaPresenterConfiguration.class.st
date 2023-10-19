Class {
	#name : 'SgaPresenterConfiguration',
	#superclass : 'Object',
	#category : 'Stargate-Presenters',
	#package : 'Stargate',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
SgaPresenterConfiguration class >> applicationName [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
SgaPresenterConfiguration class >> fileName [

	^ self subclassResponsibility
]

{ #category : 'instance creation' }
SgaPresenterConfiguration class >> readFromFileSystem [
	| reference |

	reference := self reference.
	reference exists ifFalse: [ ^ self new ].
	^ reference readStreamDo: [ :stream | 
		STON fromStream: stream  ]
]

{ #category : 'accessing' }
SgaPresenterConfiguration class >> reference [

	^ (FileLocator preferences / self applicationName / self fileName) withExtension: 'ston'
]

{ #category : 'writing' }
SgaPresenterConfiguration >> referenceExists: reference [
	
	"self error: ('There is already a configuration file at {1}.' 
			format: { reference fullName })"
	
	reference ensureDelete			
]

{ #category : 'writing' }
SgaPresenterConfiguration >> writeToFile [
	| reference |

	reference := self class reference.
	reference exists ifTrue: [ 
		self referenceExists: reference ]. 
	reference parent ensureCreateDirectory.
	reference writeStreamDo: [ :stream | 
		STON put: self onStreamPretty: stream ]
]
