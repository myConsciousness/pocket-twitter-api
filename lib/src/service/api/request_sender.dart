// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:twitter_api_v2/twitter_api_v2.dart';

// 🌎 Project imports:
import '../../core/api/endpoint.dart';
import 'parameter_helper.dart';

class RequestSender extends ParameterHelper {
  /// Returns the new instance of [RequestSender].
  const RequestSender(
    this._accessToken,
    this._endpoint,
    super.parameters,
  );

  /// The access token for this request.
  final String _accessToken;

  /// The endpoint to communicate.
  final Endpoint _endpoint;

  Future<TwitterResponse> execute({
    required Function(RetryEvent event)? onRetry,
  }) async {
    final twitter = TwitterApi(
      bearerToken: _accessToken,
      retryConfig: RetryConfig(
        maxAttempts: 5,
        onExecute: onRetry,
      ),
    );

    switch (_endpoint) {
      case Endpoint.getTweetsSearchRecent:
        return await twitter.tweets.searchRecent(
          query: requiredStringValueOf('query'),
          maxResults: intValueOf('max_results'),
          nextToken: stringValueOf('next_token'),
          sortOrder: enumValueOf(SortOrder.valueOf, 'sort_order'),
          startTime: datetimeOf('start_time'),
          endTime: datetimeOf('end_time'),
          sinceTweetId: stringValueOf('since_id'),
          untilTweetId: stringValueOf('until_id'),
          expansions: tweetExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
          placeFields: placeFields,
          pollFields: pollFields,
          mediaFields: mediaFields,
        );
      case Endpoint.getTweetsCountsRecent:
        return await twitter.tweets.countRecent(
          query: requiredStringValueOf('query'),
          nextToken: stringValueOf('next_token'),
          startTime: datetimeOf('start_time'),
          endTime: datetimeOf('end_time'),
          sinceTweetId: stringValueOf('since_id'),
          untilTweetId: stringValueOf('until_id'),
          granularity: enumValueOf(
            TweetCountGranularity.valueOf,
            'granularity',
          ),
        );
      case Endpoint.deleteTweetsId:
        return await twitter.tweets.destroyTweet(
          tweetId: requiredStringValueOf('id'),
        );
      case Endpoint.postTweets:
        final mediaIds = stringValuesOf('media.media_ids');
        final placeId = stringValueOf('geo.place_id');
        final pollDuration = intValueOf('poll.duration_minutes');
        final pollOptions = stringValuesOf('poll.options');
        final inReplyToTweetId = stringValueOf('reply.in_reply_to_tweet_id');

        return await twitter.tweets.createTweet(
          text: stringValueOf('text') ?? '',
          quoteTweetId: stringValueOf('quote_tweet_id'),
          forSuperFollowersOnly: boolValueOf('for_super_followers_only'),
          replySetting: enumValueOf(
            ReplySetting.valueOf,
            'reply_settings',
          ),
          directMessageDeepLink: stringValueOf('direct_message_deep_link'),
          media: mediaIds != null
              ? TweetMediaParam(
                  mediaIds: mediaIds,
                  taggedUserIds: stringValuesOf(
                    'media.tagged_user_ids',
                  ),
                )
              : null,
          geo: placeId != null
              ? TweetGeoParam(
                  placeId: placeId,
                )
              : null,
          poll: pollDuration != null && pollOptions != null
              ? TweetPollParam(
                  duration: Duration(minutes: pollDuration),
                  options: pollOptions)
              : null,
          reply: inReplyToTweetId != null
              ? TweetReplyParam(
                  inReplyToTweetId: inReplyToTweetId,
                  excludeReplyUserIds: stringValuesOf(
                    'reply.exclude_reply_user_ids',
                  ),
                )
              : null,
        );
      case Endpoint.deleteUsersIdLikesTweetId:
        return await twitter.tweets.destroyLike(
          userId: requiredStringValueOf('id'),
          tweetId: requiredStringValueOf('tweet_id'),
        );
      case Endpoint.postUsersIdLikes:
        return await twitter.tweets.createLike(
          userId: requiredStringValueOf('id'),
          tweetId: requiredStringValueOf('tweet_id'),
        );
      case Endpoint.getTweetsIdLikingUsers:
        return await twitter.tweets.lookupLikingUsers(
          tweetId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.getUsersIdLikedTweets:
        return await twitter.tweets.lookupLikedTweets(
          userId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: tweetExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
          placeFields: placeFields,
          pollFields: pollFields,
          mediaFields: mediaFields,
        );
      case Endpoint.deleteUsersIdRetweetsSourceTweetId:
        return await twitter.tweets.destroyRetweet(
          userId: requiredStringValueOf('id'),
          tweetId: requiredStringValueOf('source_tweet_id'),
        );
      case Endpoint.postUsersIdRetweets:
        return await twitter.tweets.createRetweet(
          userId: requiredStringValueOf('id'),
          tweetId: requiredStringValueOf('tweet_id'),
        );
      case Endpoint.getTweetsIdRetweetedBy:
        return await twitter.tweets.lookupRetweetedUsers(
          tweetId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
          placeFields: placeFields,
          pollFields: pollFields,
          mediaFields: mediaFields,
        );
      case Endpoint.getTweetsIdQuoteTweets:
        return await twitter.tweets.lookupQuoteTweets(
          tweetId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: tweetExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
          placeFields: placeFields,
          pollFields: pollFields,
          mediaFields: mediaFields,
        );
      case Endpoint.getUsers:
        return await twitter.users.lookupByIds(
          userIds: requiredStringValuesOf('ids'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.getUsersId:
        return await twitter.users.lookupById(
          userId: requiredStringValueOf('id'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.getUsersBy:
        return await twitter.users.lookupByNames(
          usernames: requiredStringValuesOf('usernames'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.getUsersByUsernameUsername:
        return await twitter.users.lookupByName(
          username: requiredStringValueOf('username'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.getUsersMe:
        return await twitter.users.lookupMe(
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.deleteUsersSourceUserIdBlockingTargetUserId:
        return await twitter.users.destroyBlock(
          userId: requiredStringValueOf('source_user_id'),
          targetUserId: requiredStringValueOf('target_user_id'),
        );
      case Endpoint.getUsersIdBlocking:
        return await twitter.users.lookupBlockingUsers(
          userId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.postUsersIdBlocking:
        return await twitter.users.createBlock(
          userId: requiredStringValueOf('id'),
          targetUserId: requiredStringValueOf('target_user_id'),
        );
      case Endpoint.deleteUsersSourceUserIdFollowingTargetUserId:
        return await twitter.users.destroyFollow(
          userId: requiredStringValueOf('source_user_id'),
          targetUserId: requiredStringValueOf('target_user_id'),
        );
      case Endpoint.postUsersIdFollowing:
        return await twitter.users.createFollow(
          userId: requiredStringValueOf('id'),
          targetUserId: requiredStringValueOf('target_user_id'),
        );
      case Endpoint.getUsersIdFollowers:
        return await twitter.users.lookupFollowers(
          userId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.getUsersIdFollowing:
        return await twitter.users.lookupFollowings(
          userId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.deleteUsersSourceUserIdMutingTargetUserId:
        return await twitter.users.destroyMute(
          userId: requiredStringValueOf('source_user_id'),
          targetUserId: requiredStringValueOf('target_user_id'),
        );
      case Endpoint.postUsersIdMuting:
        return await twitter.users.createMute(
          userId: requiredStringValueOf('id'),
          targetUserId: requiredStringValueOf('target_user_id'),
        );
      case Endpoint.getUsersIdMuting:
        return await twitter.users.lookupMutingUsers(
          userId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.getListsIdTweets:
        return await twitter.lists.lookupTweets(
          listId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: tweetExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.deleteUsersIdFollowedListsListId:
        return await twitter.lists.destroyFollow(
          userId: requiredStringValueOf('id'),
          listId: requiredStringValueOf('list_id'),
        );
      case Endpoint.postUsersIdFollowedLists:
        return await twitter.lists.createFollow(
          userId: requiredStringValueOf('id'),
          listId: requiredStringValueOf('list_id'),
        );
      case Endpoint.getListsIdFollowers:
        return await twitter.lists.lookupFollowers(
          listId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: userExpansions,
          userFields: userFields,
        );
      case Endpoint.getUsersIdFollowedLists:
        return await twitter.lists.lookupFollowedLists(
          userId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: listExpansions,
          userFields: userFields,
          listFields: listFields,
        );
      case Endpoint.getListsId:
        return await twitter.lists.lookupById(
          listId: requiredStringValueOf('id'),
          expansions: listExpansions,
          userFields: userFields,
          listFields: listFields,
        );
      case Endpoint.getUsersIdOwnedLists:
        return await twitter.lists.lookupOwnedBy(
          userId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: listExpansions,
          userFields: userFields,
          listFields: listFields,
        );
      case Endpoint.deleteListsIdMembersUserId:
        return await twitter.lists.destroyMember(
          listId: requiredStringValueOf('id'),
          userId: requiredStringValueOf('user_id'),
        );
      case Endpoint.postListsIdMembers:
        return await twitter.lists.createMember(
          listId: requiredStringValueOf('id'),
          userId: requiredStringValueOf('user_id'),
        );
      case Endpoint.getListsIdMembers:
        return await twitter.lists.lookupMembers(
          listId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: userExpansions,
          tweetFields: tweetFields,
          userFields: userFields,
        );
      case Endpoint.getUsersIdListMemberships:
        return await twitter.lists.lookupMemberships(
          userId: requiredStringValueOf('id'),
          maxResults: intValueOf('max_results'),
          paginationToken: stringValueOf('pagination_token'),
          expansions: listExpansions,
          userFields: userFields,
          listFields: listFields,
        );
      case Endpoint.deleteListsId:
        return await twitter.lists.destroyList(
          listId: requiredStringValueOf('id'),
        );
      case Endpoint.postLists:
        final private = boolValueOf('private') ?? false;

        if (private) {
          return await twitter.lists.createPrivateList(
            name: requiredStringValueOf('name'),
            description: stringValueOf('description'),
          );
        }

        return await twitter.lists.createPublicList(
          name: requiredStringValueOf('name'),
          description: stringValueOf('description'),
        );
      case Endpoint.putListsId:
        final private = boolValueOf('private') ?? false;

        if (private) {
          return await twitter.lists.updateListAsPrivate(
            listId: requiredStringValueOf('id'),
            name: stringValueOf('name'),
            description: stringValueOf('description'),
          );
        }

        return await twitter.lists.updateListAsPublic(
          listId: requiredStringValueOf('id'),
          name: stringValueOf('name'),
          description: stringValueOf('description'),
        );
      case Endpoint.deleteUsersIdPinnedListsListId:
        return await twitter.lists.destroyPinnedList(
          userId: requiredStringValueOf('id'),
          listId: requiredStringValueOf('list_id'),
        );
      case Endpoint.postUsersIdPinnedLists:
        return await twitter.lists.createPinnedList(
          userId: requiredStringValueOf('id'),
          listId: requiredStringValueOf('list_id'),
        );
      case Endpoint.getUsersIdPinnedLists:
        return await twitter.lists.lookupPinnedLists(
          userId: requiredStringValueOf('id'),
          expansions: listExpansions,
          userFields: userFields,
          listFields: listFields,
        );
    }
  }
}
