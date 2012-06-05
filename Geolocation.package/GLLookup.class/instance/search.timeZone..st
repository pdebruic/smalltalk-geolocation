as yet unclassified
search: aUrl timeZone: aBoolean
	|args|
	aBoolean ifTrue: [args:='ip=', ip , '&timezone=true' ]ifFalse:[args:='ip=' , ip ] .

	^HTTPSocket httpGetDocument: aUrl 
					args: args
					accept: 'text/xml'.