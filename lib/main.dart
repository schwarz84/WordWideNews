
// Del sistema
import 'package:flutter/material.dart';

// Creados por mua
import 'package:WordWideNews/src/theme/dark_theme.dart';
import 'package:WordWideNews/src/pages/tabs_page.dart';
import 'package:provider/provider.dart';
import 'package:WordWideNews/src/services/news_services.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => new NewsService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: myTheme,
        home: TabsPage()
        
        
      ),
    );
      
  }    
}