// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceStateProvider =
    StateNotifierProvider<_ServiceStateNotifier, Service>((ref) {
  return _ServiceStateNotifier();
});

class _ServiceStateNotifier extends StateNotifier<Service> {
  _ServiceStateNotifier() : super(Service.tweets);

  void update(final Service service) => state = service;
}

enum Service {
  /// Tweets Service.
  tweets('Tweets Service'),

  /// Users Service.
  users('Users Service');

  /// The item name of drawer menu.
  final String itemName;

  const Service(this.itemName);
}
