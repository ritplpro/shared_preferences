import 'package:animated_container/login_page.dart';
import 'package:animated_container/splash_screen.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_page.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:' my app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true
      ),
      home: SplashScreen(),
    );
  }
}


