import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List _buttonLabels = [
    "おめでとう。",
    "合格です。",
    "よくできました。",
    "残念でした。",
    "不合格です。",
    "がんばりましょう。"
  ];
  List _soundIds = [0, 0, 0, 0, 0];

  Soundpool _soundpool;

  /// Widget生成時に呼ばれるmethod
  @override
  void initState() async {
    super.initState();
    await _initSounds();
  }

  Future<void> _initSounds() async {
    _soundpool = Soundpool();

    _soundIds[0] = await loadSound("assets/sounds/sound1.mp3");
    _soundIds[1] = await loadSound("assets/sounds/sound2.mp3");
    _soundIds[2] = await loadSound("assets/sounds/sound3.mp3");
    _soundIds[3] = await loadSound("assets/sounds/sound4.mp3");
    _soundIds[4] = await loadSound("assets/sounds/sound5.mp3");
    _soundIds[5] = await loadSound("assets/sounds/sound6.mp3");
  }

  Future loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) => _soundpool.load(value))
  }

  /// Widgetが破毀される際に呼ばれるmethod
  @override
  void dispose() {
    _soundpool = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ツッコミマシーン"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // TODO ボタン
                  Expanded(
                      flex: 1,
                      child: _soundButton(0, 0)),
                  Expanded(flex: 1, child: _soundButton(1, 1)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // TODO ボタン
                  Expanded(flex: 1, child: _soundButton(2, 2)),
                  Expanded(flex: 1, child: _soundButton(3, 3)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // TODO ボタン
                  Expanded(flex: 1, child: _soundButton(4, 4)),
                  Expanded(flex: 1, child: _soundButton(5, 5)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _soundButton(int displayNumber, int soundId) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text(_buttonLabels[displayNumber]),

      ),
    );
  }

}
