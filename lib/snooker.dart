import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'drawer.dart';

const scoreSize = Size(128, 1);

Icon getBallIcon(Color color) {
  return Icon(
    Icons.circle,
    color: color,
    size: 64,
    shadows: const [
      Shadow(
        blurRadius: 15,
        offset: Offset(0.0, 2.0),
        color: Colors.grey,
      )
    ],
  );
}

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
    color: primaryColor,
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  1: Text(
                    "Player2",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                },
                selectionIndex: _curPlayer,
                borderColor: Colors.black,
                selectedColor: secondaryColor,
                unselectedColor: Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(scoreSize),
                  ),
                  child: Text(
                    "${_scores_[0]}",
                    style: const TextStyle(fontSize: 64),
                  )),
              const Text(
                ":",
                style: TextStyle(fontSize: 64, color: primaryColor),
              ),
              TextButton(
                  onPressed: () => showMaterialNumberPicker(
                        context: context,
                        title: "Score of Player2",
                        maxNumber: 147,
                        minNumber: 0,
                        selectedNumber: _scores_[1],
                        onChanged: (value) =>
                            setState(() => _scores_[1] = value),
                      ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(scoreSize),
                  ),
                  child: Text(
                    "${_scores_[1]}",
                    style: const TextStyle(fontSize: 64),
                  )),
            ],
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
                  icon: getBallIcon(const Color(0xFFFF0000)),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    _scores_[_curPlayer] += 2;
                  }),
                  icon: getBallIcon(Colors.yellow),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    _scores_[_curPlayer] += 3;
                  }),
                  icon: getBallIcon(Colors.green),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    _scores_[_curPlayer] += 4;
                  }),
                  icon: getBallIcon(const Color(0xFFA52A2A)),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    _scores_[_curPlayer] += 5;
                  }),
                  icon: getBallIcon(Colors.blue),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    _scores_[_curPlayer] += 6;
                  }),
                  icon: getBallIcon(const Color(0xFFFF7FFF)),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    _scores_[_curPlayer] += 7;
                  }),
                  icon: getBallIcon(Colors.black),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    _scores_[1 - _curPlayer] += 4;
                  }),
                  icon: const Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 64,
                    shadows: [
                      Shadow(
                        blurRadius: 15,
                        offset: Offset(0.0, 2.0),
                        color: Colors.grey,
                      )
                    ],
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
