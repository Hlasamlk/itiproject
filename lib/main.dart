import 'package:flutter/material.dart';
import 'package:project/views/aboutus.dart';
import 'package:project/views/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AboutUs(),
    );
  }
}

