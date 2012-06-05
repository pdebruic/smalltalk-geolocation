as yet unclassified
findCityAndTimeZone: anIPAddress
"Just does a country only lookup using the service at: http://ipinfodb.com/ip_location_api.php"
	^self new getCity: anIPAddress timeZone: true.