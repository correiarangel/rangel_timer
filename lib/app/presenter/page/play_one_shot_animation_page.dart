import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

/// Demonstrates playing a one-shot animation on demand
class PlayOneShotAnimationPage extends StatefulWidget {
  const PlayOneShotAnimationPage({Key? key}) : super(key: key);

  @override
  State<PlayOneShotAnimationPage> createState() =>
      _PlayOneShotAnimationPageState();
}

class _PlayOneShotAnimationPageState extends State<PlayOneShotAnimationPage> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One-Shot Example'),
      ),
      body: Center(
        child: SizedBox(
          child: RiveAnimation.asset(
            'assets/boo-cat.riv',
            animations: const ['idle', 'curves'],
            fit: BoxFit.fill,
            controllers: [_controller],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // disable the button while playing the animation
        onPressed: () => _isPlaying ? null : _controller.isActive = true,
        tooltip: 'Bounce',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
