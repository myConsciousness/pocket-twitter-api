// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:twitter_api_v2/twitter_api_v2.dart';

const enumSchema = <String, List<Serializable>>{
  'tweets.expansions': TweetExpansion.values,
  'users.expansions': UserExpansion.values,
  'tweet.fields': TweetField.values,
  'user.fields': UserField.values,
  'place.fields': PlaceField.values,
  'poll.fields': PollField.values,
  'media.fields': MediaField.values,
  'sort_order': SortOrder.values,
};
