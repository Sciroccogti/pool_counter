import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'drawer.dart';

class Snooker extends StatefulWidget {
  Snooker({Key? key}) : super(key: key);

  @override
  _SnookerState createState() => _SnookerState();
}

class _SnookerState extends State<Snooker> {
  static int _curPlayer = 0;
  static List<int> _scores_ = <int>[0, 0];
  // var _lastScores_ = <int>[0, 0]; // TODO: return
  static const Icon _playing = Icon(
    IconData(0xe655, fontFamily: "iconfont"),
    color: themeColor,
  );
  static const Icon _waiting = Icon(
    Icons.airline_seat_recline_normal_rounded,
    color: Colors.grey,
  );
  final _icons_ = <Icon>[_playing, _waiting];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              _icons_[0],
              Expanded(
                  child: MaterialSegmentedControl(
                children: const {
                  0: Text(
                    "Player1",
                    style: TextStyle(fontSize: 24),
                  ),
                  1: Text(
                    "Player2",
                    style: TextStyle(fontSize: 24),
                  ),
                },
                selectionIndex: _curPlayer,
                borderColor: Colors.grey,
                selectedColor: themeColor,
                unselectedColor: Colors.white,
                borderRadius: 16.0,
                onSegmentChosen: (int index) {
                  setState(() {
                    _curPlayer = index;
                    _icons_[_curPlayer] = _playing;
                    _icons_[1 - _curPlayer] = _waiting;
                  });
                },
              )),
              _icons_[1],
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              TextButton(
                  onPressed: () => showMaterialNumberPicker(
                        context: context,
                        title: "Score of Player1",
                        maxNumber: 147,
                        minNumber: 0,
                        selectedNumber: _scores_[0],
                        onChanged: (value) =>
                            setState(() => _scores_[0] = value),
                      ),
                  child: Text(
                    "${_scores_[0]}",
                    style: const TextStyle(fontSize: 64),
                  )),
              const Text(
                ":",
                style: TextStyle(fontSize: 64, color: themeColor),
              ),
              TextButton(
                  onPressed: () => showMaterialNumberPicker(
                        context: context,
                        title: "Score of Player1",
                        maxNumber: 147,
                        minNumber: 0,
                        selectedNumber: _scores_[1],
                        onChanged: (value) =>
                            setState(() => _scores_[1] = value),
                      ),
                  child: Text(
                    "${_scores_[1]}",
                    style: const TextStyle(fontSize: 64),
                  )),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                IconButton(
                    onPressed: () => setState(() {
                          _scores_[_curPlayer]++;
                        }),
                    icon: const Icon(
                      Icons.circle,
                      color: Color(0xFFFF0000),
                      size: 64,
                    )),
                IconButton(
                    onPressed: () => setState(() {
                          _scores_[_curPlayer] += 2;
                        }),
                    icon: const Icon(
                      Icons.circle,
                      color: Colors.yellow,
                      size: 64,
                    )),
                IconButton(
                    onPressed: () => setState(() {
                          _scores_[_curPlayer] += 3;
                        }),
                    icon: const Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 64,
                    )),
                IconButton(
                    onPressed: () => setState(() {
                          _scores_[_curPlayer] += 4;
                        }),
                    icon: const Icon(
                      Icons.circle,
                      color: Color(0xFFA52A2A),
                      size: 64,
                    )),
                IconButton(
                    onPressed: () => setState(() {
                          _scores_[_curPlayer] += 5;
                        }),
                    icon: const Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 64,
                    )),
                IconButton(
                    onPressed: () => setState(() {
                          _scores_[_curPlayer] += 6;
                        }),
                    icon: const Icon(
                      Icons.circle,
                      color: Color(0xFFFF7FFF),
                      size: 64,
                    )),
                IconButton(
                    onPressed: () => setState(() {
                          _scores_[_curPlayer] += 7;
                        }),
                    icon: const Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 64,
                    )),
                IconButton(
                  onPressed: () => setState(() {
                    _scores_[1 - _curPlayer] += 4;
                  }),
                  icon: const Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 64,
                  ),
                  tooltip: "罚 4 分",
                ),
              ],
            ),
          ),
        ]),
        appBar: AppBar(
          title: const Text('Snooker'),
        ),
        drawer: const MyDrawer(),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            child: const Icon(Icons.delete),
            onPressed: () => setState(() {
              _scores_ = [0, 0];
            }),
            heroTag: null,
          ),
        ]));
  }
}
