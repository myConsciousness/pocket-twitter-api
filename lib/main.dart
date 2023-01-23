// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
}

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Twitter API Playground',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const TwitterApiPlayground(),
      ),
    ),
  );
}

class TwitterApiPlayground extends ConsumerWidget {
  const TwitterApiPlayground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      body: Column(
        children: [
          Text('$count'),
          ElevatedButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: const Text('Push'),
          )
        ],
      ),
    );
  }
}
