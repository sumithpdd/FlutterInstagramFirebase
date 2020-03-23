import 'package:flutter/material.dart';
import 'package:flutter_instagram_firebase/screens/signup_screen.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instagram Firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        SignupScreen.id : (context) => SignupScreen(),
      },
    );
  }
} 