Extension { #name : #CmCommandGroup }

{ #category : #'*Stargate' }
CmCommandGroup class >> forSpecNamed: aString [

	^ (self named: aString) asSpecGroup
]
