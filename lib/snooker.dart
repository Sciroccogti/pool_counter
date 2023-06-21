import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
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

enum Players { player1, player2 }

class _SnookerState extends State<Snooker> {
  static int _curPlayer = 0;
  Players playerView = Players.player1;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                  child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment<int>(
                      value: 0, label: Text('Player1'), icon: _waiting),
                  ButtonSegment<int>(
                      value: 1, label: Text('Player2'), icon: _waiting),
                ],
                selected: <int>{_curPlayer},
                onSelectionChanged: (Set<int> newSelection) {
                  setState(() {
                    _curPlayer = newSelection.first;
                  });
                },
                selectedIcon: _playing,
              )),
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
              padding: const EdgeInsets.all(32),
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              crossAxisCount: 3,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    setState(() {
                      _scores_[_curPlayer] += 1;
                    });
                  },
                  icon: getBallIcon(const Color(0xFFFF0000)),
                  enableFeedback: true,
                ),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    setState(() {
                      _scores_[_curPlayer] += 2;
                    });
                  },
                  icon: getBallIcon(Colors.yellow),
                ),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    setState(() {
                      _scores_[_curPlayer] += 3;
                    });
                  },
                  icon: getBallIcon(Colors.green),
                ),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    setState(() {
                      _scores_[_curPlayer] += 4;
                    });
                  },
                  icon: getBallIcon(const Color(0xFFA52A2A)),
                ),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    setState(() {
                      _scores_[_curPlayer] += 5;
                    });
                  },
                  icon: getBallIcon(Colors.blue),
                ),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    setState(() {
                      _scores_[_curPlayer] += 6;
                    });
                  },
                  icon: getBallIcon(const Color(0xFFFF7FFF)),
                ),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    setState(() {
                      _scores_[_curPlayer] += 7;
                    });
                  },
                  icon: getBallIcon(Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    setState(() {
                      _scores_[1 - _curPlayer] += 4;
                    });
                  },
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
            onPressed: () {
              HapticFeedback.vibrate();
              setState(() {
                _scores_ = [0, 0];
              });
            },
            heroTag: null,
            child: const Icon(Icons.delete),
          ),
        ]));
  }
}
