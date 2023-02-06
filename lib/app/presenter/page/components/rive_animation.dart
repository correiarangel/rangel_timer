import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../ui/theme/app_color.dart';

class RiveAnimationCustom extends StatefulWidget {
  const RiveAnimationCustom({
    Key? key,
  }) : super(key: key);

  @override
  State<RiveAnimationCustom> createState() => _RiveAnimationCustomState();
}

class _RiveAnimationCustomState extends State<RiveAnimationCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      decoration: BoxDecoration(
        color: AppColor.colorSpaceCadet,
        shape: BoxShape.circle,
      ),
      child: const  RiveAnimation.asset('assets/boo-cat.riv'),
      
    );
  }
}
