Extension { #name : 'SpMenuGroupPresenter' }

{ #category : '*Stargate' }
SpMenuGroupPresenter >> accept: aVisitor [

	^ aVisitor visitMenuGroupPresenter: self
]
