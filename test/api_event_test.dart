import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'test_helper.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockPathProvider(), debug: true);

  var api = NeteaseMusicApi();

  const defaultUserId = '3375937';

  setUp(() async {
    await needLogin(api);
  });

  test('test_event_list', () async {
    var result = await api.eventList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_event_my_list', () async {
    var result = await api.eventMyList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_forward_delete_event', () async {
    var result = await api.eventForward(defaultUserId, '12485325409',
        forwards: '偶尔会发笑_');
    expect(result.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    var result2 = await api.eventDelete('${result.data.eventId}');
    expect(result2.code, RET_CODE_OK);
  });

  test('test_share_resource', () async {
    var result =
        await api.shareResource('52057476', type: 'playlist', msg: '偶尔会发笑');
    expect(result.code, RET_CODE_OK);

    var result2 = await api.eventDelete('${result.event.id}');
    expect(result2.code, RET_CODE_OK);
  });

  test('test_event_comment_list', () async {
    var result = await api.eventList(defaultUserId);
    expect(result.code, RET_CODE_OK);
    expect(result.events, isNotEmpty);

    var result2 = await api.eventCommentList(result.events[0].info.threadId);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_topic_hot_list', () async {
    var result = await api.topicHotList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_hot_topic_detail_event', () async {
    var result = await api.topicHotList();
    expect(result.code, RET_CODE_OK);

    if (result.hot.isEmpty) {
      return;
    }

    var result2 = await api.hotTopicDetailEvent(result.hot[0].actId);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_topic_detail', () async {
    var result = await api.topicHotList();
    expect(result.code, RET_CODE_OK);

    if (result.hot.isEmpty) {
      return;
    }

    var result2 = await api.topicDetail(result.hot[0].actId);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_song_comment_list', () async {
    var result = await api.commentList('167975', 'song');
    expect(result.code, RET_CODE_OK);

    var result2 = await api.commentList2('167975', 'song');
    expect(result2.code, RET_CODE_OK);
  });

  test('test_album_comment_list', () async {
    var result = await api.commentList('16967', 'album');
    expect(result.code, RET_CODE_OK);

    var result2 = await api.commentList2('16967', 'album');
    expect(result2.code, RET_CODE_OK);
  });

  test('test_playlist_comment_list', () async {
    var result = await api.commentList('2819660572', 'playlist');
    expect(result.code, RET_CODE_OK);

    var result2 = await api.commentList2('2819660572', 'playlist');
    expect(result2.code, RET_CODE_OK);
  });

  test('test_mv_comment_list', () async {
    var result = await api.commentList('5300126', 'mv');
    expect(result.code, RET_CODE_OK);

    var result2 = await api.commentList2('5300126', 'mv');
    expect(result2.code, RET_CODE_OK);
  });

  test('test_dj_comment_list', () async {
    var result = await api.commentList('526230592', 'dj');
    expect(result.code, RET_CODE_OK);

    var result2 = await api.commentList2('526230592', 'dj');
    expect(result2.code, RET_CODE_OK);
  });

  test('test_video_comment_list', () async {
    var result =
        await api.commentList('84107D4616B72B929C8AEB7D1E6CC904', 'video');
    expect(result.code, RET_CODE_OK);

    var result2 =
        await api.commentList2('84107D4616B72B929C8AEB7D1E6CC904', 'video');
    expect(result2.code, RET_CODE_OK);
  });

  test('test_hot_comment_list', () async {
    var result =
        await api.hotCommentList('84107D4616B72B929C8AEB7D1E6CC904', 'video');
    expect(result.code, RET_CODE_OK);
  });

  test('test_hotwall_comment_list', () async {
    var result = await api.hotwallCommentList();
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_REQUEST_NOT_FOUNT));
  });

  test('test_user_comments', () async {
    var result = await api.userComments(
        NeteaseMusicApi().usc.accountInfo?.account.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_comments_history', () async {
    var result = await api.userCommentsHistory(
        NeteaseMusicApi().usc.accountInfo?.account.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_comments', () async {
    var result = await api.commentList('2819660572', 'playlist');
    expect(result.code, RET_CODE_OK);

    if (result.comments.isEmpty) {
      return;
    }

    // result.comments[0].commentId parentCommentId
    var result2 =
        await api.floorComments('2819660572', 'playlist', '3597827084');
    expect(result2.code, RET_CODE_OK);
  });

  test('test_forwards', () async {
    var result = await api.forwards();
    expect(result.code, RET_CODE_OK);
  });

  test('test_like_comment', () async {
    var result = await api.commentList('2819660572', 'playlist');
    expect(result.code, RET_CODE_OK);

    if (result.comments.isEmpty) {
      return;
    }

    var result2 = await api.likeComment(
        '2819660572', result.comments[0].commentId, 'playlist', true);
    expect(result2.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    var result3 = await api.likeComment(
        '2819660572', result.comments[0].commentId, 'playlist', false);
    expect(result3.code, RET_CODE_OK);
  });

  test('test_comment', () async {
    var result = await api.commentList('2819660572', 'playlist');
    expect(result.code, RET_CODE_OK);

    if (result.comments.isEmpty) {
      return;
    }

    var result2 =
        await api.comment('2819660572', 'playlist', 'add', content: '123');
    expect(result2.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    var result3 = await api.comment('2819660572', 'playlist', 'reply',
        content: '321', commentId: result2.comment.commentId);
    expect(result3.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    var result4 = await api.comment('2819660572', 'playlist', 'delete',
        commentId: result2.comment.commentId);
    expect(result4.code, RET_CODE_OK);
  });

  test('test_like', () async {
    var result2 = await api.likeResource('2819660572', 'playlist', false);
    expect(result2.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    var result3 = await api.likeResource('2819660572', 'playlist', true);
    expect(result3.code, RET_CODE_OK);
  });

  test('test_hub_commnet', () async {
    var result = await api.commentList('167975', 'song');
    expect(result.code, RET_CODE_OK);

    if (result.comments.isEmpty) {
      return;
    }

    var result2 = await api.hugComment('167975', 'song',
        result.comments[0].user.userId, result.comments[0].commentId);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_hub_commnet_list', () async {
    var result = await api.commentList('167975', 'song');
    expect(result.code, RET_CODE_OK);

    if (result.comments.isEmpty) {
      return;
    }

    var result2 = await api.hugCommentList('167975', 'song',
        result.comments[0].user.userId, result.comments[0].commentId);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_private_msg_conversation_list', () async {
    var result = await api.privateMsgListUsers();
    expect(result.code, RET_CODE_OK);

    result.msgs.forEach((element) {
      element.msgObj;
    });
  });

  test('test_private_msg_conversation_list', () async {
    var result = await api.recentContactUsers();
    expect(result.code, RET_CODE_OK);
  });

  test('test_send_private_msg', () async {
    var result =
        await api.sendPrivateMsg('test', '3251549719', playlist: '117666725');
    expect(result.code, RET_CODE_OK);

    result.newMsgs.forEach((element) {
      element.msgObj;
    });
  });

  test('test_private_msg_history', () async {
    var result = await api.privateMsgListUser(defaultUserId);
    expect(result.code, RET_CODE_OK);

    result.msgs.forEach((element) {
      element.msgObj;
    });
  });

  test('test_msg_notices', () async {
    var result = await api.msgNotices();
    expect(result.code, RET_CODE_OK);
  });
}
