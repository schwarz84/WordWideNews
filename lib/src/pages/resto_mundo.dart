

import 'package:flutter/material.dart';

import 'package:WordWideNews/src/widgets/lista_country.dart';


class RestoMundoPage extends StatefulWidget {
  @override
  _RestoMundoPageState createState() => _RestoMundoPageState();
}

class _RestoMundoPageState extends State<RestoMundoPage> {
  @override
  Widget build(BuildContext context) {
    
    
    // BUG: hAY QUE SOLUCIONAR CUANDO CAMBIAS LA ORIENTACION
      
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget> [
              
              ListaCountry()
              
            ],
          ),
        ),
        // body: ,
      ),
    );
    
  }
}