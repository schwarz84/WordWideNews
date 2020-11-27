

import 'package:flutter/material.dart';

// Traduce el nombre en las categorias
String cambiarNombre(String nombre) {
  
  String resp;
  
  switch (nombre) {
    case 'general':
      resp = 'Noticias Top';
    break;
    case 'business':
      resp = 'Negocios';
    break;
    case 'entertainment':
      resp = 'Entretenimiento';
    break;
    case 'health':
      resp = 'Salud';
    break;
    case 'science':
      resp = 'Ciencia';
    break;
    case 'sports':
      resp = 'Deportes';
    break;
    case 'technology':
      resp = 'Tecnologia';
    break;
  }
  
        
  
  return resp;
}

// Remplaza todo el arreglo de los paises
List<String> paises() {
  
  List<String> paises = ['Emiratos Árabes', 'Argentina', 'Austria', 'Australia', 'Bélgica', 'Bulgaria', 'Brasil', 'Canadá', 'Suiza', 'China', 'Colombia', 'Cuba', 'República Checa', 'Alemania', 'Egipto', 'Francia', 'Reino Unido', 'Grecia', 'Hong Kong', 'Hungría', 'Indonesia', 'Irlanda', 'Israel', 'India', 'Italia', 'Japón', 'Corea del Sur', 'Lituania', 'Letonia', 'Marruecos', 'México', 'Malasia', 'Nigeria', 'Países Bajos', 'Noruega', 'Nueva Zelanda', 'Filipinas', 'Polonia', 'Portugal', 'Rumanía', 'Serbia y Montenegro', 'Rusia', 'Arabia Saudita', 'Suecia', 'Singapur', 'Eslovenia', 'Eslovaquia', 'Tailandia', 'Turquía', 'Taiwán', 'Ucrania', 'Estados Unidos', 'Venezuela', 'Sudáfrica'];
  
  
  return paises;
}


// Le asigna el codigo de pais
String codigoSegunNombre(String nombre) {
  
  List<String> pais = paises();
  
  List<String> code = ['ae', 'ar', 'at', 'au', 'be', 'bg', 'br', 'ca', 'ch', 'cn', 'co', 'cu', 'cz', 'de', 'eg', 'fr', 'gb', 'gr', 'hk', 'hu', 'id', 'ie', 'il', 'in', 'it', 'jp', 'kr', 'lt', 'lv', 'ma', 'mx', 'my', 'ng', 'nl', 'no', 'nz', 'ph', 'pl', 'pt', 'ro', 'rs', 'ru', 'sa', 'se', 'sg', 'si', 'sk', 'th', 'tr', 'tw', 'ua', 'us', 've', 'za'];
  
  int i = 0;
  
  while (pais[i] != nombre) {
    i++;
  }
  
  
  
  return code[i];   
  
}

// Le genera la bandera segun el codigo
Image iconoSegunCodigo(String pais) {
  
  return Image.asset('icons/flags/png/$pais.png', package: 'country_icons',
          height: 20, width: 30, fit: BoxFit.fill);
  
}
