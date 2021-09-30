import 'package:flutter/material.dart';
import 'package:monibie/enums/routes.dart';
import 'package:monibie/homescreen.dart';
import 'package:monibie/provider/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider( providers: [
        ChangeNotifierProvider(create: (_) => ShoppingCart()),
      ],child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}
