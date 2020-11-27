

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:WordWideNews/src/pages/resto_mundo.dart';
// import 'package:WordWideNews/src/services/news_services.dart';
import 'package:WordWideNews/src/utils/utilidades.dart';


String _PAIS = 'Emiratos Árabes';

class ListaCountry extends StatelessWidget {
  

  
  @override
  Widget build(BuildContext context) {
    
    
    // String pais = 'Emiratos Árabes';
    
       
    return Column(
      children: <Widget> [
        
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text('Seleccione el País', style: GoogleFonts.amita(fontSize: 30.0))
        ),
        
        SizedBox(height: 20,),
        
        _ListaPaises(),
        
        SizedBox(height: 20,),
        
        _ImageCountry(),
        
        
        
      ],
    );
  }
}

class _ListaPaises extends StatefulWidget {


@override
  __ListaPaisesState createState() {
  
    return __ListaPaisesState();
  }
}

class __ListaPaisesState extends State<_ListaPaises> {
  
  String pais = _PAIS;

  
  @override
  Widget build(BuildContext context) {
    
    _ImageCountry();
    return Container(
      alignment: Alignment.center,
      child: DropdownButton(
        value: pais,
        icon: Icon(Icons.arrow_downward),
        iconSize: 30.0,
        elevation: 16,
        style: TextStyle(fontSize: 20.0),
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (selecPais) {
          setState(() {
            pais = selecPais;
            _PAIS = pais;
            RestoMundoPage();
          });
        },
        items: paises().map((e) {
          return DropdownMenuItem(
            value: e,
            child: FlagName(nombre: e)
          );
        }).toList(),
      ),
    );
  }
}

class FlagName extends StatelessWidget {
  
  final String nombre;

  const FlagName({ 
  @required  this.nombre});  
  
  @override
  Widget build(BuildContext context) {
    
    final String code = codigoSegunNombre(nombre);
    final Image flag = iconoSegunCodigo(code);    
    
    
    return Column(
      children: <Widget> [
        
        Row(
          children: <Widget>[
            
            Container(  
              child: flag,
            ),
            
            SizedBox(width: 5),
            
            Text(nombre)
          ],
        )
      ],
      
    );
  }
}

class _ImageCountry extends StatefulWidget {
  
 
  
  @override
  __ImageCountryState createState() => __ImageCountryState();
}

  String pais = 'Emiratos Árabes';
class __ImageCountryState extends State<_ImageCountry> {
  @override
  Widget build(BuildContext context) {
    
  
  if (pais != _PAIS) {
    setState(() {
      pais = _PAIS;
      
    });
    
  } else {
    pais = _PAIS;
  }  
    
    String code = codigoSegunNombre(pais);
     
    
    
    return Container(
      child: Image(
          image: AssetImage('assets/image/paises/$code.png'),
          fit: BoxFit.fill,
          width: double.infinity,
          height: 400,
      ),
    );
  }
}

