

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:WordWideNews/src/models/news_model.dart';
import 'package:WordWideNews/src/theme/dark_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ListaNoticias extends StatelessWidget {
  
  final List<Article> noticias;

  const ListaNoticias(this.noticias); 
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,  
      itemBuilder: (BuildContext context, int index) {
        
        return _Noticia(
          noticia: this.noticias[index], 
          indice: index 
        );
      },    
    );
  }
}

class _Noticia extends StatelessWidget {
  
  final Article noticia;
  final int indice;

  const _Noticia({
  @required  this.noticia,
  @required  this.indice
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        _Fecha(noticia: noticia),
        
        _TarjetaTopBar(
          noticia: noticia, 
          index: indice
        ),
        
        _TarjetaTitulo(noticia: noticia),
        
        _TarjetaImagen(noticia: noticia),
        
        _TarjetaDescrip(noticia: noticia,),
        
        _TarjetaBotones(noticia: noticia),
        
      ],
    );
  }
}

class _Fecha extends StatelessWidget {
  
  final Article noticia;

  const _Fecha({
    this.noticia
  });
  
  @override
  Widget build(BuildContext context) {
  
    String dia = noticia.publishedAt.day.toString();
    String mes = noticia.publishedAt.month.toString();
    String year = noticia.publishedAt.year.toString();
    
    return Container(
      padding: EdgeInsets.only(right: 5),
      alignment: Alignment.centerRight,
      child: Text('$dia - $mes - $year')     
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _TarjetaTopBar({
    this.noticia, 
    this.index
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget> [
          Text('${index + 1} - ', style: TextStyle(color: myTheme.accentColor)),
          Text(noticia.source.name, style: GoogleFonts.lato())
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaTitulo({this.noticia});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.0),
      margin: EdgeInsets.symmetric(vertical: 7.0),
      child: Text(noticia.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaImagen({ this.noticia});
  
  @override
  Widget build(BuildContext context) {
    
    String urlImagen = noticia.urlToImage;
    
    if (noticia.source.name == 'La Nacion') {
      urlImagen = 'http:' + noticia.urlToImage;
    }
    
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
        child: Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: (urlImagen != null)
              ? FadeInImage(
                  placeholder: AssetImage('assets/image/giphy.gif'),
                  image: NetworkImage(urlImagen),
              )
              : Image(image: AssetImage('assets/image/no-image.png'))
        ),
      ),
    );
  }
}

class _TarjetaDescrip extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaDescrip({this.noticia});  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: (noticia.description == null || noticia.description == '')
            ? Text(noticia.title, style: TextStyle(fontStyle: FontStyle.italic))
            : Text(noticia.description, style: TextStyle(fontStyle: FontStyle.italic))
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaBotones({this.noticia});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0)
              )
            ),
            child: Icon(FontAwesomeIcons.bookmark),
          ),
          
          SizedBox(width: 10.0),
          
          RawMaterialButton(
            onPressed: () {
              launch(noticia.url);
            },
            fillColor: Colors.blue[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0), 
                bottomRight: Radius.circular(20.0)
              )
            ),
            child: Icon(FontAwesomeIcons.externalLinkAlt),
          )
        ],
      ),
    );
  }
}