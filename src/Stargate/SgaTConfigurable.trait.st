Trait {
	#name : #SgaTConfigurable,
	#category : #'Stargate-Presenters'
}

{ #category : #'private configuration' }
SgaTConfigurable >> configurationClass [
	"Override me"

	^ nil
]

{ #category : #initialization }
SgaTConfigurable >> initializeWindow: aWindowPresenter [

	aWindowPresenter withConfigurationDo: [ :configuration |
		self 
			initializeWindow: aWindowPresenter 
			configuration: aWindowPresenter ]
]

{ #category : #initialization }
SgaTConfigurable >> initializeWindow: aWindowPresenter configuration: configuration [

	aWindowPresenter whenWillCloseDo: [ self storeSettings ]
]

{ #category : #'private configuration' }
SgaTConfigurable >> storeSettings [

	self withConfigurationDo: [ :configuration |
		self storeSettingsInto: configuration.
		configuration writeToFile ]
]

{ #category : #'private configuration' }
SgaTConfigurable >> storeSettingsInto: aConfiguration [
	"Override me"
]

{ #category : #'private configuration' }
SgaTConfigurable >> withConfigurationDo: aBlock [

	self configurationClass ifNil: [ ^ self ].
	aBlock value: self configurationClass readFromFileSystem
]
