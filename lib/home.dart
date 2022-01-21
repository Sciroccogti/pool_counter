import 'package:flutter/material.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            "共 $_count 杆",
            style: const TextStyle(fontSize: 64),
          ),
        ),
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const MyDrawer(),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            child: const Icon(Icons.delete),
            onPressed: () => setState(() {
              _count = 0;
            }),
            heroTag: null,
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.add),
            // onPressed: () => _someFunc(),
            onPressed: () => setState(() {
              _count++;
            }),
            heroTag: null,
          )
        ]));
  }
}
