Trait {
	#name : 'SgaTApplication',
	#instVars : [
		'standalone'
	],
	#category : 'Stargate-Application',
	#package : 'Stargate',
	#tag : 'Application'
}

{ #category : 'private' }
SgaTApplication >> exitApplication [

	Smalltalk exitSuccess
]

{ #category : 'initialization' }
SgaTApplication >> killUnusedProcesses [
	"remove non used processes (remaining from the UI world)"

	"Since this is not a morphic application, I need to kill the morphic loop"
	MorphicUIManager uiProcess terminate
]

{ #category : 'initialization' }
SgaTApplication >> prepareAsStandaloneApplication [
	
	standalone := true.
	self prepareSchedulerAsStandaloneApplication.
	self killUnusedProcesses
]

{ #category : 'initialization' }
SgaTApplication >> prepareSchedulerAsStandaloneApplication [

	Smalltalk vm isRunningInWorkerThread 
		ifTrue: [ ProcessorScheduler idleTime: 3600000000*12 "12hs" ]
]

{ #category : 'testing' }
SgaTApplication >> shouldExitWhenNoMoreWindows [

	^ true
]

{ #category : 'private' }
SgaTApplication >> unregisterWindow: aWindow [

	super unregisterWindow: aWindow.
	self verifyPossibleExit
]

{ #category : 'private' }
SgaTApplication >> verifyPossibleExit [

	self windows ifNotEmpty: [ ^ self ].
	self isStandalone ifFalse: [ ^ self ].
	self shouldExitWhenNoMoreWindows ifFalse: [ ^ self ].
	self exitApplication
]
