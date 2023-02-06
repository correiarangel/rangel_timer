import 'package:flutter/material.dart';

import '../store/store_timer.dart';
import 'text_timer.dart';

class CirculasProgress extends StatelessWidget {
  final StoreTimer store;
  final double seg;
  final double maxSeg;
  const CirculasProgress({
    Key? key,
    required this.store,
    required this.seg,
    required this.maxSeg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: store.seconds == 0 ? false : true,
          child: TextTimer(seconds: store.seconds),
        ),
        Visibility(
          visible: store.seconds == 0 ? true : false,
          // ignore: prefer_const_constructors
          child: Icon(
            size: 80,
            Icons.check,
            // color: Colors.green,
          ),
        ),
        SizedBox(
          height: 250,
          width: 250,
          child: CircularProgressIndicator(
            strokeWidth: 10,
            value: seg / maxSeg,
          ),
        )
      ],
    );
  }
}
