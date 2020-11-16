Class {
	#name : #SgaNotification,
	#superclass : #Object,
	#category : #'Stargate-NotificationCenter'
}

{ #category : #converting }
SgaNotification class >> asNotification [

	^ self new
]

{ #category : #accessing }
SgaNotification class >> receiverSelector [

	^ #note:
]

{ #category : #accessing }
SgaNotification class >> systemIconName [

	^ #announcementIcon
]

{ #category : #converting }
SgaNotification >> asNotification [

	^ self
]

{ #category : #accessing }
SgaNotification >> dispatchTo: anObject [
	| selector |

	selector := self lookupSelectorOn: anObject.
	
	"(anObject className,'>>',selector,'(', self receiverSelector, ')') crTrace. "
		
	anObject 
		perform: selector
		with: self
]

{ #category : #private }
SgaNotification >> lookupSelectorOn: anObject [

	^ self 
		lookupSelectorOn: anObject 
		for: self class
]

{ #category : #private }
SgaNotification >> lookupSelectorOn: anObject for: aNotificationClass [

	^ (anObject respondsTo: aNotificationClass receiverSelector)
		ifTrue: [ aNotificationClass receiverSelector ]
		ifFalse: [ 
			(aNotificationClass = SgaNotification) 
				ifTrue: [ self error: 'Notification receiver not defined.' ]. 
			self lookupSelectorOn: anObject for: aNotificationClass superclass ].
]

{ #category : #accessing }
SgaNotification >> receiverSelector [

	^ self class receiverSelector
]
