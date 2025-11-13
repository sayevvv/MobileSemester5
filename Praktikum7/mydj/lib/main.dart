import 'package:flutter/material.dart';
import 'package:mydj/pages/login_page.dart';
import 'package:mydj/pages/simple_home_page.dart';
import 'package:provider/provider.dart';
import 'package:mydj/data/data_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDJ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
    );
  }
}
