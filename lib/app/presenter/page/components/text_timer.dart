import 'package:flutter/material.dart';

class TextTimer extends StatelessWidget {
  final int seconds;
  const TextTimer({Key? key, required this.seconds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      seconds.toString(),
      style: const TextStyle(fontSize:80.0 ),
    );
  }
}
