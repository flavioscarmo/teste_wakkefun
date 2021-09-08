
import 'package:exemplo_feed/_utilitys/AppConfig.dart';
import 'package:exemplo_feed/ui/HomePage/homePage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: markPrimaryColor
    ));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: markPrimaryColor,
          centerTitle: true,
          brightness: Brightness.dark,
        ),
      ),
      home: Stack(children: [
          HomePage(),
        ],
      )
    );
  }
}
