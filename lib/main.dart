import 'package:cep_app/common/constants.dart';
import 'package:cep_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: kPrimaryColor,
        appBarTheme: const AppBarTheme(color: kComponentsColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: kTextElevatedButtons,
            backgroundColor: kComponentsColor,
            
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
