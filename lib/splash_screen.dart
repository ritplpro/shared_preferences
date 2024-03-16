import 'dart:async';

import 'package:animated_container/home_page.dart';
import 'package:animated_container/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN="login";

  @override
  void initState() {
    WhereToGo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: FaIcon(FontAwesomeIcons.handshake,
          size: 100,
          color: Colors.lightGreen,),
      ),
    );
  }

  void WhereToGo() async {
    var prefs=await SharedPreferences.getInstance();
    var isLogedin = prefs.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2),(){

      if(isLogedin!=null){
        if(isLogedin){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=> HomePage(),));
        } else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>LoginPage(),));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>LoginPage(),));
      };


    });

  }
}


