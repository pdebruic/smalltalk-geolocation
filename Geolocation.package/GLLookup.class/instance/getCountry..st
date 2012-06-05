as yet unclassified
getCountry: anIPAddress
	|url httpResponse xml xmlResponse|
	ip:=anIPAddress.
	location:=GLLocation new.
	url:='http://ipinfodb.com/ip_query_country.php'.
	httpResponse:=self search: url timeZone: false.
	xml:=XMLDOMParser parseDocumentFrom: (ReadStream on: httpResponse contents).
	xmlResponse :=xml elementAt:#Response.
	((xmlResponse contentStringAt:'Status')='OK') ifTrue:[
	location countryName: (xmlResponse contentStringAt:'CountryName').
	location isoCountryCode: (xmlResponse contentStringAt:'CountryCode').].
^location.