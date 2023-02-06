import 'package:flutter/material.dart';
import 'button_custom.dart';
import '../store/store_timer.dart';

class RowButtons extends StatelessWidget {
  final StoreTimer store;
  const RowButtons({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonsCustom(
              textSize: 24.0,
              text: store.text,
              callback: () {
                if (store.text == 'Pause' && store.seconds > 0) {
                  store.pauseTimer();
                  store.changeText();
                } else  if(store.seconds>0){
                  store.resumeTimer();
                  store.changeText();
                }
              },
              top: 8,
              rigth: 8,
              left: 8,
            ),
            ButtonsCustom(
              textSize: 24.0,
              text: 'Cancel',
              callback: () {
                if (store.seconds > 0) store.stopTimer();
              },
              top: 8,
              rigth: 8,
              left: 8,
            ),
            ButtonsCustom(
              textSize: 24.0,
              text: 'Start',
              callback: () {
                store.startTimer(seconde: 60);
              },
              top: 8,
              rigth: 8,
              left: 8,
            ),
          ],
        );
      },
    );
  }
}
