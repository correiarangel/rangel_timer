import 'dart:developer';

import 'package:flutter/material.dart';

import 'components/progress_pulse.dart';
import 'components/rive_animation.dart';
import 'components/row_buttons.dart';
import 'store/store_timer.dart';

class TimerPulsePage extends StatefulWidget {
  final StoreTimer store;
  const TimerPulsePage({Key? key, required this.store}) : super(key: key);

  @override
  State<TimerPulsePage> createState() => _TimerPulsePageState();
}

class _TimerPulsePageState extends State<TimerPulsePage> {
  @override
  Widget build(BuildContext context) {
    final store = widget.store;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: store,
              builder: (context, child) {
                if (store.seconds == 1) store.startAnimation();
                double seg = double.parse(store.seconds.toString());
                double maxSeg = double.parse(store.maxSeconds.toString());
                log(seg.toString());
                return store.isAnimation
                    ? const RiveAnimationCustom()
                    : ProgressPulse(
                        store: store,
                        seg: seg,
                        segMax: maxSeg,
                      );
              }),
          AnimatedBuilder(
            animation: store,
            builder: (context, child) {
              return Visibility(
                visible: store.isAnimation,
                child: const Text(
                  'Segundou !.....',
                  style: TextStyle(fontSize: 48),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
          SizedBox(height: height * .1),
          RowButtons(store: store),
        ],
      ),
    );
  }
}
