Extension { #name : #SpCommand }

{ #category : #'*Stargate' }
SpCommand >> asActionButtonPresenter [
	
	^ SpButtonPresenter new
		owner: self context;
		help: self description;
		icon: self icon;
		action: [ self execute ];
		yourself
]
