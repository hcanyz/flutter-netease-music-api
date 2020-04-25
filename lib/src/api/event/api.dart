import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/event/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

mixin ApiEvent {
  /// 获取用户动态
  /// !需要登录
  /// [lastTime] 传入上一次返回结果的 lasttime,将会返回下一页的数据,默认-1
  Future<EventListWrap> eventList(String userId,
      {int limit = 30, int lastTime = -1}) {
    return Https.dio
        .postUri(joinUri('/weapi/event/get/$userId'),
            data: {'userId': userId, 'time': lastTime, 'limit': limit},
            options: joinOptions())
        .then((Response value) {
      return EventListWrap.fromJson(value.data);
    });
  }

  /// 转发用户动态
  /// !需要登录
  /// [evId] 动态 id
  /// [forwards] 转发的评论
  Future<EventForwardRetWrap> eventForward(String userId, String evId,
      {String forwards = ''}) {
    return Https.dio
        .postUri(joinUri('/weapi/event/forward'),
            data: {'eventUserId': userId, 'id': evId, 'forwards': forwards},
            options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return EventForwardRetWrap.fromJson(value.data);
    });
  }

  /// 删除用户动态
  /// !需要登录
  /// [evId] 动态 id
  Future<ServerStatusBean> eventDelete(String evId) {
    return Https.dio
        .postUri(joinUri('/weapi/event/delete'),
            data: {'id': evId}, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 分享歌曲、歌单、mv、电台、电台节目到动态
  /// !需要登录
  /// [id] 资源 id （歌曲，歌单，mv，电台，电台节目对应 id）
  /// [type] 资源类型，默认歌曲 song，可传 song,playlist,mv,djradio,djprogram
  /// [msg] 内容，140 字限制，支持 emoji，@用户名（/user/follows接口获取的用户名，用户名后和内容应该有空格），图片暂不支持
  Future<EventSingleWrap> shareResource(String id,
      {String type = 'song', String msg = ''}) {
    return Https.dio
        .postUri(joinUri('/weapi/share/friends/resource'),
            data: {'id': id, 'type': type, 'msg': msg}, options: joinOptions())
        .then((Response value) {
      return EventSingleWrap.fromJson(value.data);
    });
  }

  /// 分享歌曲、歌单、mv、电台、电台节目到动态
  /// !需要登录
  /// [threadId] 资源 id （歌曲，歌单，mv，电台，电台节目对应 id）
  Future<CommentListWrap> eventCommentList(String threadId, int page,
      {int limit = 30, int beforeTime = 0}) {
    var params = {
      'limit': limit,
      'offset': page * limit,
      'beforeTime': beforeTime
    };
    return Https.dio
        .postUri(joinUri('/weapi/v1/resource/comments/$threadId'),
            data: params, options: joinOptions())
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
    });
  }

  /// 获取热门话题
  Future<TopicHotListWrap> topicHotList(int page, {int limit = 20}) {
    var params = {'limit': limit, 'offset': page * limit};
    return Https.dio
        .postUri(joinUri('/weapi/act/hot'),
            data: params, options: joinOptions())
        .then((Response value) {
      return TopicHotListWrap.fromJson(value.data);
    });
  }

  /// 获取云村热评
  Future<HotwallCommentListWrap> hotwallCommentList() {
    return Https.dio
        .postUri(joinUri('/api/comment/hotwall/list/get'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return HotwallCommentListWrap.fromJson(value.data);
    });
  }
}