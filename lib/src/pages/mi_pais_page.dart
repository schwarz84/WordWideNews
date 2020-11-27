

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:WordWideNews/src/widgets/lista_noticas.dart';
import 'package:WordWideNews/src/widgets/lista_categorias.dart';
import 'package:WordWideNews/src/services/news_services.dart';

class MiPaisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final newsServices = Provider.of<NewsService>(context);
    
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget> [
            ListaCategoria(),
            
            if(!newsServices.isLoading) 
              Expanded(
                child: ListaNoticias(newsServices.getArticle)
              ),
            if(newsServices.isLoading) 
              Expanded(
                child: Center(
                  child: CircularProgressIndicator()
                )
              )
          
          ],
        ),
      ),
    );
  }
}

