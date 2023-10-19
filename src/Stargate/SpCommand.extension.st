Extension { #name : 'SpCommand' }

{ #category : '*Stargate' }
SpCommand >> asActionButtonPresenter [
	
	^ SpButtonPresenter new
		owner: self context;
		help: self description;
		icon: self icon;
		action: [ self execute ];
		yourself
]

{ #category : '*Stargate' }
SpCommand >> asLabeledButtonPresenter [
	
	^ self asActionButtonPresenter
		label: self name;
		yourself
]

{ #category : '*Stargate' }
SpCommand >> asToggleButtonPresenter [
	
	^ SpToggleButtonPresenter new
		owner: self context;
		help: self description;
		icon: self icon;
		whenActivatedDo: [ self execute ];
		whenDeactivatedDo: [ self execute ];
		yourself
]
