import 'package:flutter/material.dart';


import '../store/store_timer.dart';
import '../../../ui/theme/app_color.dart';
import 'circular_progress.dart';

class ProgressPulse extends StatefulWidget {
  final StoreTimer store;
  final double seg;
  final double segMax;
  const ProgressPulse({
    Key? key,
    required this.store,
    required this.seg,
    required this.segMax,
  }) : super(key: key);

  @override
  State<ProgressPulse> createState() => _ProgressPulseState();
}

class _ProgressPulseState extends State<ProgressPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );
    _animation = Tween(begin: 5.0, end: 80.0)
        .chain(CurveTween(curve: Curves.linear))
        .animate(_animationController);
        
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final secund = widget.seg;
    final color = _getColor(secund);
    _stageOne(secund);
    _stageTwo(secund);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Column(
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  color: AppColor.colorSpaceCadet,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: color,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color,
                      blurRadius: _animation.value > 0 ? 20 : 0,
                      spreadRadius: _animation.value / 2,
                    )
                  ]),
              child: Center(
                child: CirculasProgress(
                  store: widget.store,
                  seg: widget.seg,
                  maxSeg: widget.segMax,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _stageOne(double secund) {
    if (secund > 0.0 && _animationController.isDismissed) {
      _animationController.repeat(reverse: true);
    } else if (secund <= 60 && secund > 0.0) {
      _animationController.reverse();
    } else if (secund == 0.0) {
      _animationController.stop();
    }
  }

  void _stageTwo(double secund) {
    if (secund < 40 && secund > 29 && _animationController.isDismissed) {
      _animationController.stop();
      _animationController.duration = const Duration(milliseconds: 250);
      _animationController.repeat(reverse: true);
    } else if (secund < 30 && secund > 14 && _animationController.isDismissed) {
      _animationController.stop();
      _animationController.duration = const Duration(milliseconds: 150);
      _animationController.repeat(reverse: true);
    } else if (secund < 15 && secund > 0 && _animationController.isDismissed) {
      _animationController.stop();
      _animationController.duration = const Duration(milliseconds: 50);
      _animationController.repeat(reverse: true);
    } else if (secund <= 1 &&
        _animationController.duration?.inMilliseconds == 50) {
      _animationController.stop();
      _animationController.duration = const Duration(milliseconds: 600);
      _animationController.repeat(reverse: true);
    }
  }

  Color _getColor(double secund) {
    if (secund < 40.0 && secund > 29.0) return AppColor.colorLavenderFloral;
    if (secund < 30.0 && secund > 14.0) return AppColor.colorCultured;
    if (secund < 15.0 && secund >= 1.0) return AppColor.colorOldLavender;
    if (secund == 0.0) return AppColor.colorOldLavender;
    return AppColor.colorSkyMagenta;
  }
}
