import 'package:flutter/material.dart';
import 'package:veg_kitchen/screens/foods_list_screen.dart';
import 'package:veg_kitchen/screens/home_screen.dart';
import 'package:veg_kitchen/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VeganKitchen',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: LightTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
