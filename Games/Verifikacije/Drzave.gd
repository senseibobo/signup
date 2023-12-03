extends Verifikacija
class_name Drzave

var drzave: PoolStringArray

const c = """Afghanistan
Albania
Algeria
Antigua and Barbuda
Argentina
Armenia
Australia
Austria
Azerbaijan
Azores
Bahamas
Bangladesh
Barbados
Belarus
Belgium
Belize
Bermuda
Bolivia
BIH
Bosnia
Brazil
Bulgaria
Cambodia
Cameroon
Canada
Cape Verde
Chile
China
Columbia
Costa Rica
Croatia
Cuba
Cyprus
Czech Republic
Czechoslovakia
Denmark
Dominica
Dominican Republic
Ecuador
Egypt
El Salvador
England
Eritrea
Ethiopia
Fiji
Finland
France
Georgia
Germany
Ghana
Greece
Grenada
Guam
Guatemala
Guyana
Haiti
Honduras
Hong Kong
Hungary
India
Indonesia
Iran
Iraq
Ireland
Israel
Italy
Jamaica
Japan
Jordan
Kenya
Korea
Kuwait
Laos
Latvia
Lebanon
Liberia
Lithuania
Macedonia
Malaysia
Mexico
Moldova
Morocco
Myanmar
Nepal
Netherlands
New Zealand
Nicaragua
Nigeria
Northern Ireland
Norway
Pakistan
Panama
Paraguay
Peru
Philippines
Poland
Portugal
Puerto Rico
Romania
Russia
Samoa
Saudi Arabia
Scotland
Senegal
Serbia
Sierra Leone
Singapore
Slovakia
Somalia
South Africa
South Korea
Spain
Sri Lanka
St. Lucia
Sudan
Sweden
Switzerland
Syria
Taiwan
Tanzania
Thailand
Tonga
Trinidad and Tobago
Turkey
Uganda
Ukraine
United Kingdom
United States
Uruguay
USSR
Uzbekistan
Venezuela
Vietnam
Wales
Yemen
Yugoslavia
Zimbabwe"""

func _init():
	drzave = c.split("\n")
	message = "Your password must contain a country in it."

func verifikuj(text: String):
	text = text.to_lower()
	for drzava in drzave:
		if drzava.to_lower() in text:
			return true
	return false
