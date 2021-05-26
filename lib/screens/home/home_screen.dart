import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'home_state_notifier.dart';

final counterProvider = StateNotifierProvider((ref) => HomeStateNotifier());

class HomeScreen extends HookWidget {
  HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final homeState = useProvider(counterProvider.state);
    void increment() => context.read(counterProvider).increment();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text('${homeState.count}')),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
