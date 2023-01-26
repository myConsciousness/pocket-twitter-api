// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum Service {
  /// Tweets Service.
  tweets('Tweets Service'),

  /// Users Service.
  users('Users Service');

  /// The item name of drawer menu.
  final String itemName;

  const Service(this.itemName);
}
