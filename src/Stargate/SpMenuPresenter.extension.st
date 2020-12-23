Extension { #name : #SpMenuPresenter }

{ #category : #'*Stargate' }
SpMenuPresenter >> accept: aVisitor [

	aVisitor visitMenuPresenter: self
]

{ #category : #'*Stargate' }
SpMenuPresenter >> asKMCategory [
	| builder |
	
	builder := SgaKMCategoryMenuBuilder new.
	self accept: builder.
	^ builder kmCategory
]
