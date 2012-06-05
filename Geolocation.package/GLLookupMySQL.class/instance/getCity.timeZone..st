as yet unclassified
getCity: anIPAddress timeZone: aBoolean
	| spec connection statement resultSet  |
	ip:=anIPAddress.
	location:=GLLocation new.
Socket initializeNetwork.
spec :=    (JdmConnectionSpec new initialize
        user: 'ip'; password: 'geolocation1';
        host: (NetNameResolver addressForName: 'localhost');
        database: 'ipinfodb_one_table_full_country';
        port: 3306).


connection := JdmConnection on: spec.
statement := connection createStatement.
resultSet := statement executeQuery: 'select * from ip_group_country where ip_start <= inet_aton("', anIPAddress , '") order by ip_start desc limit 1'.
[resultSet next]
whileTrue: [
	location  isoCountryCode: (resultSet valueNamed: 'country_code').
].			

connection close.	
	
	

^location.