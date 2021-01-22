import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import './timer_hook.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PageCustomHook(),
    );
  }
}

class HomePageHook extends HookWidget {
  const HomePageHook({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _numberNotifier = useState(0);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _numberNotifier.value = timer.tick;
      });
      return timer.cancel;
    }, const []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Center(
        child: Text(_numberNotifier.value.toString()),
      ),
    );
  }
}

class PageCustomHook extends HookWidget {
  const PageCustomHook({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final num = useInfiniteTimer(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('text'),
      ),
      body: Center(
        child: Text(
          num.toString(),
        ),
      ),
    );
  }
}
