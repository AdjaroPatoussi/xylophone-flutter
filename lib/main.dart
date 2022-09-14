import 'package:flutter/material.dart';
// import 'package:audioplayers/src/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: sound(),
        ),
      ),
    );
  }
}

class sound extends StatefulWidget {
  const sound({Key? key}) : super(key: key);

  @override
  State<sound> createState() => _soundState();
}

class _soundState extends State<sound> {
  Expanded expande(int sound, Color col) {
    return Expanded(
        flex: 1,
        child: FlatButton(
          onPressed: () {
            setState(() {
              final player = AudioPlayer();
              player.setSource(AssetSource('note$sound.wav'));
              player.resume();
            });
          },
          color: col,
          child: Container(
            width: double.infinity,
          ),
        ));
  }

  //player.play(AssetSource('sounds/note1.wave'));
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          expande(1, Colors.red),
          expande(2, Colors.yellow),
          expande(3, Colors.blue),
          expande(4, Colors.green),
          expande(5, Colors.blueGrey),
          expande(6, Colors.orangeAccent),
          expande(7, Colors.teal)
        ],
      ),
    );
  }
}
