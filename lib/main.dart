import 'package:flutter/material.dart';
import 'home.dart';
import 'snooker.dart';

void main() {
  runApp(const MyApp());
  print("done");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // used by the OS task switcher
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext ctx) => HomePage(),
        "/snooker": (BuildContext ctx) => Snooker(),
      },
    );
  }
}