import 'package:flutter/material.dart';

import 'screen/login_screen.dart';
import 'screen/main_screens.dart';
import 'screen/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20.0),
          headline2: TextStyle(color: Colors.white,fontSize: 20.0),
        ),
        
      ),
      routes: {
        SignUpScreen.routeName: (context)=> const SignUpScreen(),
        LogInScreen.routeName: (context)=> const LogInScreen(),
      },
      home: const LogInScreen(),
    );
  }
}

