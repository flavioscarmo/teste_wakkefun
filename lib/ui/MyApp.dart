
import 'package:exemplo_feed/_utilitys/AppConfig.dart';
import 'package:exemplo_feed/ui/HomePage/homePage_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(children: [
          HomePage(),
        ],
      )
    );
  }
}
