"
I'm a visitor to make some changes in commands to prepare them to be shown as a context menu.
This is needed this because commander cannot differentiate between a command to be shown in a toolbar and in a menu. 

"
Class {
	#name : 'SgaContextMenuFormatter',
	#superclass : 'CmVisitor',
	#category : 'Stargate-Application',
	#package : 'Stargate',
	#tag : 'Application'
}

{ #category : 'visiting' }
SgaContextMenuFormatter >> visitCommand: aCmCommand [

	aCmCommand 
		icon: nil;
		iconName: nil
]
