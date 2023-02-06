import 'package:flutter/material.dart';
import 'package:rangel_timer/app/presenter/page/timer_pulse_pege.dart';

import 'presenter/page/store/store_timer.dart';


import 'ui/theme/app_thema_dracula.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rangel Timer',
      debugShowCheckedModeBanner: false,
      theme: AppThemaDracula.theme,
      home: TimerPulsePage(store: StoreTimer()),
    );
  }
}
