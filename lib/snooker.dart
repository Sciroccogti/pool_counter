import 'package:flutter/material.dart';
import 'drawer.dart';

class Snooker extends StatefulWidget {
  Snooker({Key? key}) : super(key: key);
  @override
  _SnookerState createState() => _SnookerState();
}

class _SnookerState extends State<Snooker> {
  int _count = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("共 $_count 杆",
            style: const TextStyle(fontSize: 64),),
        ),
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: MyDrawer(),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(
                    Icons.delete
                ),
                onPressed: () => setState(() {
                  _count=0;
                }),
                heroTag: null,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                child: Icon(
                    Icons.add
                ),
                // onPressed: () => _someFunc(),
                onPressed: () => setState(() {
                  _count++;
                }),
                heroTag: null,
              )
            ]
        )
    );
  }
}