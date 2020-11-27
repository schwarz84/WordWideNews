// HACER: tRATAR DE HACER MAS CORTO EL CODIGO CON ALGUN CICLO ADEMAS DE MANTENES LOS TAMAñOS ESTANDAR

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // final Size size = MediaQuery.of(context).size;
    
    return ListView(
      // padding: EdgeInsets.zero,
      children: <Widget> [
        ListTile(
          title: Row(
            children: <Widget> [
              Container(
                child: Icon(FontAwesomeIcons.mapMarkedAlt, size: 20, color: Colors.white),
                padding: EdgeInsets.only(bottom: 5)
              ),
              SizedBox(width: 30),
              Text('Mi Ubicación', style: TextStyle(fontSize: 15, color: Colors.white)),
            ],
          ),
          onTap: () {},
        ), 
               
        ListTile(
          title: Row(
            children: <Widget> [
              Container(
                child: Icon(FontAwesomeIcons.bookmark, size: 20, color: Colors.white),
                padding: EdgeInsets.only(bottom: 5)
              ),
              SizedBox(width: 30),
              Text('Mis Noticias', style: TextStyle(fontSize: 15, color: Colors.white)),
            ],
          ),
          onTap: () {},
        ),
        
        ListTile(
          title: Row(
            children: <Widget> [
              Container(
                child: Icon(FontAwesomeIcons.userCog, size: 20, color: Colors.white),
                padding: EdgeInsets.only(bottom: 5)
              ),
              SizedBox(width: 30),
              Text('Mi Cuenta', style: TextStyle(fontSize: 13, color: Colors.white)),
            ],
          ),
          onTap: () {},
        ),
        
        ListTile(
          title: Row(
            children: <Widget> [
              Container(
                child: Icon(FontAwesomeIcons.userTimes, size: 20, color: Colors.white),
                padding: EdgeInsets.only(bottom: 5)
              ),
              SizedBox(width: 30),
              Text('Cerrar Session', style: TextStyle(fontSize: 15, color: Colors.white)),
            ],
          ),
          onTap: () {},
        ),
        
        ListTile(
          title: Row(
            children: <Widget> [
              Container(
                child: Icon(FontAwesomeIcons.doorOpen, size: 20, color: Colors.white),
                padding: EdgeInsets.only(bottom:  5)
              ),
              SizedBox(width: 30),
              Text('Salir', style: TextStyle(fontSize: 15, color: Colors.white)),
            ],
          ),
          onTap: () {},
        )
        
      ]
    );
  }
}