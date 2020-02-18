colors_list = [
	["Blanco", "#FFFFFF"],
	["Azur", "#F0FFFF"],
	["Crema", "#F5FFFA"],
	["Nieve", "#FFFAFA"],
	["Marfil", "#FFFFF0"],
	["Cian Claro", "#E0FFFF"],
	["Amarillo Claro", "#FFFFE0"],
	["Lino", "#FAF0E6"],
	["Beige", "#F5F5DC"],
	["Lavanda", "#E6E6FA"],
	["Rosa Brumosa", "#FFE4E1"],
	["Blanco Antiguo", "#FAEBD7"],
	["Sopa", "#FFE4C4"],
	["Trigo", "#F5DEB3"],
	["Aguamarina", "#7FFFD4"],
	["Gris Claro", "#D3D3D3"],
	["Rosa", "#FFC0CB"],
	["Azul Claro", "#ADD8E6"],
	["Cardo", "#D8BFD8"],
	["Rosa Claro", "#FFB6C1"],
	["Verde Pálido", "#98FB98"],
	["Azul Cielo", "#87CEEB"],
	["Agua", "#00FFFF"],
	["Cian", "#00FFFF"],
	["Plata", "#C0C0C0"],
	["Ciruela", "#DDA0DD"],
	["Gris", "#BEBEBE"],
	["Verde Claro", "#90EE90"],
	["Violeta", "#EE82EE"],
	["Amarillo", "#FFFF00"],
	["Turquesa", "#40E0D0"],
	["Turquesa Medio", "#48D1CC"],
	["Salmón Claro", "#FFA07A"],
	["Aguamarina Medio", "#66CDAA"],
	["Gris Oscuro", "#A9A9A9"],
	["Marrón Arena", "#F4A460"],
	["Dorado", "#FFD700"],
	["Salmón Oscuro", "#E9967A"],
	["Turquesa Oscuro", "#00CED1"],
	["Coral Claro", "#F08080"],
	["Marrón Rosado", "#BC8F8F"],
	["Salmón", "#FA8072"],
	["Púrpura Medio", "#9370DB"],
	["Coral", "#FF7F50"],
	["Dorado Alambre", "#DAA520"],
	["Naranja", "#FFA500"],
	["Fucsia", "#FF00FF"],
	["Magenta", "#FF00FF"],
	["Gris Pizarra", "#708090"],
	["Tomate", "#FF6347"],
	["Naranja Oscuro", "#FF8C00"],
	["Verde Lima", "#32CD32"],
	["Lima", "#00FF00"],
	["Rojo Indio", "#CD5C5C"],
	["Rosa Intenso", "#FF1493"],
	["Chocolate", "#D2691E"],
	["Cian Oscuro", "#008B8B"],
	["Gris Aceituna", "#6B8E23"],
	["Violeta Oscuro", "#9400D3"],
	["Aceituna", "#808000"],
	["Siena", "#A0522D"],
	["Verde Bosque", "#228B22"],
	["Carmesí", "#DC143C"],
	["Azul", "#0000FF"],
	["Magenta Oscuro", "#8B008B"],
	["Marrón", "#A52A2A"],
	["Púrpura", "#800080"],
	["Verde", "#008000"],
	["Rojo", "#FF0000"],
	["Azul Medio", "#0000CD"],
	["Índigo", "#4B0082"],
	["Verde Oscuro", "#006400"],
	["Azul Oscuro", "#00008B"],
	["Azul Marino", "#000080"],
	["Rojo Oscuro", "#8B0000"],
	["Granate", "#800000"],
	["Negro", "#000000"]
]


colors_list.each do |nombre, hex_code|
	Color.find_or_create_by(name:nombre, hex_code:hex_code)
end


Season.find_or_create_by(name:"Primavera/Verano", note:"")
Season.find_or_create_by(name:"Otoño/Invierno", note:"")


category_list = [
	["Zapatillas","ZPTA"],
	["Botas","BOTA"],
	["Botinetas","BOTI"],
	["Botines","BOTE"],
	["Borcegos","BORC"],
	["Zapatos","ZPTO"],
	["Chatas","CHAT"],
	["Panchas","PANC"],
	["Mocasines","MOCA"],
	["Pantuflas","PANT"],
	["Sandalias","SAND"],
	["Zuecos","ZUEC"],
	["Guillerminas","GUIL"],
	["Ojotas","OJOT"],
	["Franciscanas","FRAN"],
	["Alpargatas","ALPA"],
	["Romanas","ROMA"],
	["Chinelas","CHIN"],
	["Stilettos","STIL"]

]

category_list.each do |nombre, code|
	Category.find_or_create_by(name:nombre, code:code)
end

release_country_list = [
["AR","Argentina", "ARG"],
["BR","Brasil", "BRA"],
["CL","Chile", "CHL"],
["CN","China", "CHN"],
["CO","Colombia", "COL"],
["DE","Alemania", "DEU"],
["ES","España", "ESP"],
["FR","Francia", "FRA"],
["GB","Reino Unido", "GBR"],
["TW","Taiwán", "TWN"],
["US","Estados Unidos de América", "USA"],
["UY","Uruguay", "URY"],
["VE","Venezuela", "VEN"]
]

release_country_list.each do |code, name, x|
	ReleaseCountry.find_or_create_by(code:code, name:name)
end



provider_list = [
	["Zurich Zapatos","11111111111", "(011) 2294-2198", "zapateria_zurich@outlook.com"],
	["Sheperd S.A.","30711179077", "(011) 4604-1556", "sheperdsa@prueba.com"],
	["Versato","30715501739", "(011) 4604-1556", "versato@prueba.com"],
	["Souter S.A.","30707508597", "(0341) 462-4343", "soutersa@prueba.com"]


]

provider_list.each do |provider_name, cuil, telephone, email|
	Provider.find_or_create_by(name:provider_name, cuil:cuil, telephone:telephone, email:email)
end


trademarks_list = [
	["Zurich",1],
	["Kevingstone",2],
	["Moleka",3],
	["Molekinho",3],
	["Vizzano",3],
	["Modare",3],
	["Molekinha",3],
	["Ringo",4],

]

trademarks_list.each do |trademark_name, provider_id|
	Trademark.find_or_create_by(name:trademark_name, provider:Provider.where(id:provider_id).first)
end

way_pays_list = [
	["Efectivo",2.2, nil, nil, nil],
	["Visa/Mastercard",1, 1.1315, 1.2407, 1.5441,]
]

way_pays_list.each do |way_pay_name, c1, c3, c6, c12|
	WayPay.find_or_create_by(name:way_pay_name, c1:c1, c3:c3, c6:c6, c12:c12)
end





size_list = [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46]

size_list.each do |number|
	Size.find_or_create_by(number:number)
end


user = User.new
user.email = 'sageoffroy@gmail.com'
user.password = 'quitar123'
user.save!
user.add_role 'admin'