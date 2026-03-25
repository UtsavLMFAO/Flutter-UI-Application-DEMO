import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';   
import 'screens/home_screen.dart';

void main(){
  runApp(const MyApp());
  doWhenWindowReady(() {
    appWindow.minSize = Size(500, 700);
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}