import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../components/custom_text.dart';

class CountdownOtp extends StatefulWidget {
  final int second;
  const CountdownOtp(this.second, {super.key});

  @override
  State<CountdownOtp> createState() => _CountdownOtpState();
}

class _CountdownOtpState extends State<CountdownOtp> {
  late Timer _timer;
  late int _countdown;

  @override
  void initState() {
    _countdown = widget.second;
    _startCountdown();
    super.initState();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown--;
        setState(() {});
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _countdown ~/ 60;
    int seconds = _countdown % 60;

    return CustomText.h7(
        'Request new code in ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}');
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
