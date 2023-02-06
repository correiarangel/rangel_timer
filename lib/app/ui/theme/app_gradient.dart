
import 'package:flutter/material.dart';

import 'app_color.dart';

class AppGradient {
  static BoxDecoration get gradient {
    return BoxDecoration(
      color: AppColor.colorSpaceCadet,
      gradient: LinearGradient(
        colors: [AppColor.colorSkyMagenta, AppColor.colorSpaceCadet],
        begin: const Alignment(4.0, -2.0),
        end: const Alignment(0.0, 0.0),
      ),
    );
  }
}
