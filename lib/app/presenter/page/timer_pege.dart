import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rangel_timer/app/presenter/page/components/circular_progress.dart';
import 'package:rangel_timer/app/ui/theme/app_gradient.dart';
import 'store/store_timer.dart';
import 'components/row_buttons.dart';


class TimerPage extends StatefulWidget {
  final StoreTimer store;
  const TimerPage({Key? key, required this.store}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    final store = widget.store;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: AppGradient.gradient,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: store,
                  builder: (context, child) {
                    double seg = double.parse(store.seconds.toString());
                    double maxSeg = double.parse(store.maxSeconds.toString());
                    log(seg.toString());
                    return CirculasProgress(
                      store: store,
                      seg: seg,
                      maxSeg: maxSeg,
                    );
                  }),
              SizedBox(height: height * .3),
              RowButtons(store: store),
            ],
          ),
        ),
      ),
    );
  }
}
