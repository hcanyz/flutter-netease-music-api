import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'MockNeteaseMusicApi.dart';
import 'private_config.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockCookiePathProvider(), debug: true);

  var api = NeteaseMusicApi();

  // PersistCookieJar 会存储cookie，登录完成后可以将doSetUp置为false,
  // TODO 登录接口需要验证本地是否登录只类的场景，不需要每次都去调用
  const bool doSetUp = true;

  const defaultUserId = '3375937';

  setUp(() async {
    if (!doSetUp) return;
    try {
      var result = await api.loginCellPhone(login_phone, login_phone_password);
      if (result.code == RET_CODE_OK) {
        return;
      }
      result = await api.loginEmail(login_email, login_email_password);
      if (result.code == RET_CODE_OK) {
        return;
      }
    } catch (e) {
      //前置条件允许出错
    }
  });

  test('test event list', () async {
    var result = await api.eventList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test event my list', () async {
    var result = await api.eventMyList();
    expect(result.code, RET_CODE_OK);
  });

  test('test forward delete event', () async {
    var result = await api.eventForward(defaultUserId, '12485325409',
        forwards: '偶尔会发笑_');
    expect(result.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    var result2 = await api.eventDelete('${result.data.eventId}');
    expect(result2.code, RET_CODE_OK);
  });

  test('test share resource', () async {
    var result =
        await api.shareResource('52057476', type: 'playlist', msg: '偶尔会发笑');
    expect(result.code, RET_CODE_OK);

    var result2 = await api.eventDelete('${result.event.id}');
    expect(result2.code, RET_CODE_OK);
  });

  test('test event comment list', () async {
    var result = await api.eventList(defaultUserId);
    expect(result.code, RET_CODE_OK);
    expect(result.events, isNotEmpty);

    var result2 = await api.eventCommentList(result.events[0].info.threadId);
    expect(result2.code, RET_CODE_OK);
  });

  test('test topic hot list', () async {
    var result = await api.topicHotList();
    expect(result.code, RET_CODE_OK);
  });

  test('test song comment list', () async {
    var result = await api.songCommentList('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test album comment list', () async {
    var result = await api.albumCommentList('16967');
    expect(result.code, RET_CODE_OK);
  });

  test('test playlist comment list', () async {
    var result = await api.playlistCommentList('2819660572');
    expect(result.code, RET_CODE_OK);
  });

  test('test mv comment list', () async {
    var result = await api.mvCommentList('5300126');
    expect(result.code, RET_CODE_OK);
  });

  test('test dj comment list', () async {
    var result = await api.djRadioCommentList('526230592');
    expect(result.code, RET_CODE_OK);
  });

  test('test video comment list', () async {
    var result = await api.videoCommentList('84107D4616B72B929C8AEB7D1E6CC904');
    expect(result.code, RET_CODE_OK);
  });

  test('test hot comment list', () async {
    var result =
        await api.hotCommentList('84107D4616B72B929C8AEB7D1E6CC904', 'video');
    expect(result.code, RET_CODE_OK);
  });

  test('test hotwall comment list', () async {
    var result = await api.hotwallCommentList();
    expect(result.code, RET_CODE_OK);
  });

  test('test user comments', () async {
    var result = await api.userComments(
        NeteaseMusicApi().usc?.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test forwards', () async {
    var result = await api.forwards();
    expect(result.code, RET_CODE_OK);
  });

  test('test like comment', () async {
    var result = await api.playlistCommentList('2819660572');
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

  test('test comment', () async {
    var result = await api.playlistCommentList('2819660572');
    expect(result.code, RET_CODE_OK);

    if (result.comments.isEmpty) {
      return;
    }

    var result2 =
        await api.comment('2819660572', 'playlist', 'add', content: '123');
    expect(result2.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    //    fixme 回复评论 code 400
    //    var result3 = await api.comment('2819660572', 'playlist', 'replay',
    //        content: '321', commentId: result2.comment.commentId);
    //    expect(result3.code, RET_CODE_OK);
    //
    //    sleep(Duration(seconds: 1));

    var result4 = await api.comment('2819660572', 'playlist', 'delete',
        commentId: result2.comment.commentId);
    expect(result4.code, RET_CODE_OK);
  });

  test('test like x', () async {
    var result2 = await api.likeResource('2819660572', 'playlist', false);
    expect(result2.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    var result3 = await api.likeResource('2819660572', 'playlist', true);
    expect(result3.code, RET_CODE_OK);
  });

  test('test private msg conversation list', () async {
    var result = await api.privateMsgListUsers();
    expect(result.code, RET_CODE_OK);

    result.msgs.forEach((element) {
      element.msgObj;
    });
  });

  test('test send private msg', () async {
    var result =
        await api.sendPrivateMsg('test', '3251549719', playlist: '117666725');
    expect(result.code, RET_CODE_OK);

    result.newMsgs.forEach((element) {
      element.msgObj;
    });
  });

  test('test private msg history', () async {
    var result = await api.privateMsgListUser(defaultUserId);
    expect(result.code, RET_CODE_OK);

    result.msgs.forEach((element) {
      element.msgObj;
    });
  });

  test('test msg notices', () async {
    var result = await api.msgNotices();
    expect(result.code, RET_CODE_OK);
  });
}
