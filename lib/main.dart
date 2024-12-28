import 'package:aquaflow/presentation/staff/home.dart';
import 'package:aquaflow/presentation/user/home.dart';
import 'package:aquaflow/presentation/user/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
     
      home: Login(),
    );
  }
}

