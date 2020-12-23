Extension { #name : #SpMenuItemPresenter }

{ #category : #'*Stargate' }
SpMenuItemPresenter >> accept: aVisitor [

	^ aVisitor visitMenuItemPresenter: self
]
