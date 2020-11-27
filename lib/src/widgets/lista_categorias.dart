

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:WordWideNews/src/models/category_model.dart';
import 'package:WordWideNews/src/services/news_services.dart';
import 'package:WordWideNews/src/theme/dark_theme.dart';
import 'package:WordWideNews/src/utils/utilidades.dart';

class ListaCategoria extends StatelessWidget {
  
  // BUG: hay que lograr que se almacene la ultima index que se vio segun la categoria. Posible soluciono en Ultils un manejo de Variable segun lo que ingrese.
  
  
  
  @override
  Widget build(BuildContext context) {
    
    final categorias = Provider.of<NewsService>(context).categorias;
    
    return Container(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,//Esto lo pone en una fila ROW
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int indice){
          return Container(
            width: 115,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  
                  _CategoriasIconos(categorias[indice]),
                  
                  SizedBox(height: 5),
                  
                  _CategoriasNombre(categorias[indice].nombre)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoriasNombre extends StatelessWidget {
  
  final String nombre;

  const _CategoriasNombre(this.nombre);
  
  @override
  Widget build(BuildContext context) {
    
    final newsService = Provider.of<NewsService>(context);
    
    String resp = cambiarNombre(nombre);
    
    return Text(
      resp,
      textScaleFactor: 1,
      style: TextStyle(
        color: (newsService.catSelect == this.nombre) ? myTheme.accentColor : Colors.white
      ),
    );
  }
}

class _CategoriasIconos extends StatelessWidget {
  
  final Category iconos;

  const _CategoriasIconos(this.iconos);
  
  @override
  Widget build(BuildContext context) {
    
    final newsServices = Provider.of<NewsService>(context);
    
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.catSelect = iconos.nombre;
        
      },
      child: Container(
        width: 105,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: (newsServices.catSelect == iconos.nombre) ? myTheme.accentColor : Colors.white)
        ),
        child: Icon(
          iconos.categoria,
          color: (newsServices.catSelect == iconos.nombre) ? myTheme.accentColor : Colors.white
        )
      
      ),
    );
  }
}