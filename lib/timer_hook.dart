import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

int useInfiniteTimer(BuildContext context) {
  return use(const _InfiniteTimer());
}

class _InfiniteTimer extends Hook<int> {
  const _InfiniteTimer();
  @override
  __InfiniteTimerState createState() => __InfiniteTimerState();
}

class __InfiniteTimerState extends HookState<int, _InfiniteTimer> {
  Timer _timer;
  int _num = 0;

  @override
  void initHook() {
    super.initHook();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _num = timer.tick;
      });
    });
  }

  @override
  int build(BuildContext context) {
    return _num;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
