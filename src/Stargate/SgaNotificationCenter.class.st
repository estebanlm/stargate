Class {
	#name : #SgaNotificationCenter,
	#superclass : #Object,
	#instVars : [
		'prioritySubscriptions'
	],
	#classVars : [
		'PRIORITY_DEFAULT',
		'PRIORITY_HIGH'
	],
	#category : #'Stargate-NotificationCenter'
}

{ #category : #'class initialization' }
SgaNotificationCenter class >> initialize [

	PRIORITY_DEFAULT := 2.
	PRIORITY_HIGH := 1
]

{ #category : #private }
SgaNotificationCenter >> dispatchNotification: aNotification to: anObject [

	aNotification dispatchTo: anObject
]

{ #category : #private }
SgaNotificationCenter >> dispatchNotification: aNotification toAll: aSet [

	aSet do: [ :each | 
		self dispatchNotification: aNotification to: each ]
]

{ #category : #initialization }
SgaNotificationCenter >> initialize [

	super initialize.
	prioritySubscriptions := (Array new: 2)
		at: PRIORITY_HIGH put: Dictionary new;
		at: PRIORITY_DEFAULT put: Dictionary new;
		yourself
]

{ #category : #notifying }
SgaNotificationCenter >> notify: aNotification [
	"I will send notification to all direct subscribers, but also to subscribers to the parent(s)
	 of the notification. For example, if I have 
		Notification subclass: MyNotification
	 if I notify MyNotification, I will dispatch to subscribers of MyNotification and Notification"
	| class realNotification |
	 
	realNotification := aNotification asNotification.
	class := realNotification class.
	[ class = Object ] 
	whileFalse: [ 
		(self subscriptionsTo: class) do: [ :each | 
			self dispatchNotification: realNotification to: each ].	
		class := class superclass ]
]

{ #category : #private }
SgaNotificationCenter >> prioritySubscriptionsAt: aNumber [
		
	^ prioritySubscriptions at: aNumber
]

{ #category : #subscribing }
SgaNotificationCenter >> subscribe: anObject to: anAnnouncementClass [

	self 
		subscribe: anObject 
		to: anAnnouncementClass 
		priority: PRIORITY_DEFAULT
]

{ #category : #private }
SgaNotificationCenter >> subscribe: anObject to: anAnnouncementClass priority: aNumber [

	((self prioritySubscriptionsAt: aNumber)
		at: anAnnouncementClass
		ifAbsentPut: [ WeakSet new ])
		add: anObject
]

{ #category : #subscribing }
SgaNotificationCenter >> subscribeHigh: anObject to: anAnnouncementClass [

	self 
		subscribe: anObject 
		to: anAnnouncementClass 
		priority: PRIORITY_HIGH
]

{ #category : #subscribing }
SgaNotificationCenter >> subscriptionsTo: anAnnouncementClass [ 
	
	^ (prioritySubscriptions collect: [ :each | 
			each at: anAnnouncementClass ifAbsent: [ #() ] ])
		flattened
		asArray
]
