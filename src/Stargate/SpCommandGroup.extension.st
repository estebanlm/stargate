Extension { #name : 'SpCommandGroup' }

{ #category : '*Stargate' }
SpCommandGroup >> prepareForContextMenu [

	SgaContextMenuFormatter new visit: self
]
