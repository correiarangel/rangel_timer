import 'package:flutter/material.dart';
import 'package:rangel_timer/app/ui/theme/app_color.dart';

class ButtonsCustom extends StatelessWidget {
  final double textSize;
  final String text;
  final double top;
  final double rigth;
  final double left;
  final VoidCallback callback;

  // ignore: use_key_in_widget_constructors
  const ButtonsCustom({
    required this.textSize,
    required this.text,
    required this.top,
    required this.rigth,
    required this.left,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        left: left,
        right: rigth,
      ),
      child: ElevatedButton(
        onPressed: () => callback(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
             color: AppColor.colorLavenderFloral,
          ),
        ),
      ),
    );
  }
}
