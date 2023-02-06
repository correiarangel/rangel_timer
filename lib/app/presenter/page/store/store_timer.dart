import 'dart:async';
import 'package:flutter/widgets.dart';

class StoreTimer extends ChangeNotifier {
  int _seconds = 0;
  int get seconds => _seconds;
  final int _maxSeconds = 60;
  int get maxSeconds => _maxSeconds;
  int? _secondsSave;
  bool get isAnimation => _isAnimation;
  bool _isAnimation = false;
  int? get secondsSave => _secondsSave;
  Timer? _timer;
  Timer? get timer => _timer;

  String _text = 'Pause';
  String get text => _text;

  Future<void> startAnimation()async {
    _isAnimation = !_isAnimation;
    Future.delayed(const Duration(seconds: 5), () {
      _isAnimation = !_isAnimation;
      notifyListeners();
    });
  }

  void changeText() {
    if (_text == 'Pause') {
      _text = 'Resume';
      notifyListeners();
    } else {
      _text = 'Pause';
      notifyListeners();
    }
  }

  void startTimer({required int seconde}) {
    if (_timer == null) intiTimer(seconde: seconde);
  }

  void intiTimer({required int seconde}) {
    _seconds = seconde;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_seconds > 0) {
        _seconds--;
        notifyListeners();
        if (_seconds <= 0) stopTimer();
      }
    });
  }

  void stopTimer() {
    if (_timer!.isActive) {
      _timer!.cancel();
      _seconds = 0;
      _timer = null;
      notifyListeners();
    }
  }

  void pauseTimer() {
    _secondsSave = _seconds;
    _timer!.cancel();
    _timer = null;
    notifyListeners();
  }

  void resumeTimer() {
    if (_timer != null && _timer!.isActive) _timer!.cancel();
    if (_seconds > 0) startTimer(seconde: _secondsSave ?? 0);
  }

  void resertTimer({required int second}) {
    _seconds = second;
    notifyListeners();
  }
}

enum ButtonState {
  start,
  resume,
  pause,
}
