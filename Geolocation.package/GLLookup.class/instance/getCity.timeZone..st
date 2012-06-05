as yet unclassified
getCity: anIPAddress timeZone: aBoolean
	|url httpResponse xml xmlResponse|
	ip:=anIPAddress.
	location:=GLLocation new.
	url:='http://ipinfodb.com/ip_query.php'.
	httpResponse:=self search: url timeZone: aBoolean.
	xml:=XMLDOMParser parseDocumentFrom: (ReadStream on: httpResponse contents).
	xmlResponse :=xml elementAt:#Response.
	((xmlResponse contentStringAt:'Status')='OK') ifTrue:[
	location countryName: (xmlResponse contentStringAt:'CountryName');
			 isoCountryCode: (xmlResponse contentStringAt:'CountryCode');
 			regionCode: (xmlResponse contentStringAt:'RegionCode');
		regionName: (xmlResponse contentStringAt:'RegionName');
		city: (xmlResponse contentStringAt:'City');
		zipPostalCode: (xmlResponse contentStringAt:'ZipPostalCode');
		latitude:(xmlResponse contentStringAt:'Latitude');
		longitude:(xmlResponse contentStringAt:'Longitude').
		aBoolean ifTrue:[location timeZone:(xmlResponse contentStringAt:'Timezone');
										gmtOffset: (xmlResponse contentStringAt:'Gmtoffset');
										dstOffset: (xmlResponse contentStringAt:'Dstoffset').
			
			].
	
	
	
	].
^location.