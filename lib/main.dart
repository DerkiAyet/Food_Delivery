import 'package:flutter/material.dart';
import 'package:tp/auth/login_or_register.dart';
import 'package:tp/models/restaurant.dart';
import 'package:tp/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:tp/themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        //theme Provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        //restaurant Provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: LoginOrRegister(),
    );
  }
}
