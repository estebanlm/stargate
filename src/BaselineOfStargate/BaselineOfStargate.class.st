Class {
	#name : #BaselineOfStargate,
	#superclass : #BaselineOf,
	#category : #BaselineOfStargate
}

{ #category : #baselines }
BaselineOfStargate >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		self gtk: spec.
		self spec: spec.
		
		spec package: 'Stargate' with: [ spec requires: #('SpecCore' 'GtkCore') ] ]
]

{ #category : #'external projects' }
BaselineOfStargate >> gtk: spec [

	spec baseline: 'GtkCore' with: [ 
		spec 
			repository: 'github://pharo-spec/gtk-bindings';
			className: 'BaselineOfGtk';			
			loads: 'Core' ]
]

{ #category : #'external projects' }
BaselineOfStargate >> spec: spec [

	spec baseline: 'SpecCore' with: [ 
		spec 
			repository: 'github://pharo-spec/Spec';
			loads: 'Core' ]
]
