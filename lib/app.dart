import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final counterProvider = ChangeNotifierProvider((ref) => CounterNotifier());

class CounterNotifier with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() => {
    _count++,
    notifyListeners(),
  };
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Home Screen'),
    );
  }
}

class HomeScreen extends HookWidget {
  HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final int count = useProvider(counterProvider).count;
    void increment() => context.read(counterProvider).increment();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text('$count')),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
