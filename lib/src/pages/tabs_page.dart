

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:WordWideNews/src/pages/mi_pais_page.dart';
import 'package:WordWideNews/src/pages/resto_mundo.dart';
import 'package:WordWideNews/src/widgets/menu.dart';
import 'package:provider/provider.dart';


import 'package:WordWideNews/src/theme/dark_theme.dart';
import 'package:WordWideNews/src/models/navegacion_model.dart';

class TabsPage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
  
    // final size = ;
  
    return ChangeNotifierProvider(
      create: (context) => NavegacionModel(),
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            child: MenuLateral(),
            // color: Colors.whit
          )
        ),
        appBar: AppBar(
          backgroundColor: Colors.black45,
          iconTheme: IconThemeData(
            color: Colors.white,
            // size: 70.0
          ),
          toolbarHeight: 35,
          title:Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              Text('Word Wide News',
                style: GoogleFonts.amita(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: myTheme.accentColor                            
              )),
            ],
          )
        ),
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );

  }
  
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final navegacionModel = Provider.of<NavegacionModel>(context);
    
    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        
        MiPaisPage(),
        
        RestoMundoPage()
      ],
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final navegacionModel = Provider.of<NavegacionModel>(context);
    
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual ,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.add_location),
          title: Text('Mi Pais')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          title: Text('Resto de Mundo')
        )
      ],
    );
  }
}


