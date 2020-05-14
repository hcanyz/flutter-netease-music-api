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
    var params = {'userId': userId, 'time': lastTime, 'limit': limit};
    return Https.dio
        .postUri(joinUri('/weapi/event/get/$userId'),
            data: params, options: joinOptions())
        .then((Response value) {
      return EventListWrap.fromJson(value.data);
    });
  }

  /// 获取自己动态 对应网页版网易云，朋友界面里的各种动态消息 ，如分享的视频，音乐，照片等！
  /// !需要登录
  /// [lastTime] 传入上一次返回结果的 lasttime,将会返回下一页的数据,默认-1
  Future<EventListWrap2> eventMyList({int limit = 30, int lastTime = -1}) {
    var params = {'lasttime': lastTime, 'pagesize': limit};
    return Https.dio
        .postUri(joinUri('/weapi/v1/event/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return EventListWrap2.fromJson(value.data);
    });
  }

  /// 转发用户动态
  /// !需要登录
  /// [evId] 动态 id
  /// [forwards] 转发的评论
  Future<EventForwardRetWrap> eventForward(String userId, String evId,
      {String forwards = ''}) {
    var params = {'eventUserId': userId, 'id': evId, 'forwards': forwards};
    return Https.dio
        .postUri(joinUri('/weapi/event/forward'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return EventForwardRetWrap.fromJson(value.data);
    });
  }

  /// 删除用户动态
  /// !需要登录
  /// [evId] 动态 id
  Future<ServerStatusBean> eventDelete(String evId) {
    var params = {'id': evId};
    return Https.dio
        .postUri(joinUri('/weapi/event/delete'),
            data: params, options: joinOptions())
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
    var params = {'id': id, 'type': type, 'msg': msg};
    return Https.dio
        .postUri(joinUri('/weapi/share/friends/resource'),
            data: params, options: joinOptions())
        .then((Response value) {
      return EventSingleWrap.fromJson(value.data);
    });
  }

  /// 分享歌曲、歌单、mv、电台、电台节目到动态
  /// !需要登录
  /// [threadId] 资源 id （歌曲，歌单，mv，电台，电台节目对应 id）
  Future<CommentListWrap> eventCommentList(String threadId,
      {int offset = 0, int limit = 30, int beforeTime = 0}) {
    var params = {'limit': limit, 'offset': offset, 'beforeTime': beforeTime};
    return Https.dio
        .postUri(joinUri('/weapi/v1/resource/comments/$threadId'),
            data: params, options: joinOptions())
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
    });
  }

  /// 获取热门话题
  Future<TopicHotListWrap> topicHotList({int offset = 0, int limit = 20}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/act/hot'),
            data: params, options: joinOptions())
        .then((Response value) {
      return TopicHotListWrap.fromJson(value.data);
    });
  }

  /// 歌曲评论
  Future<CommentListWrap> songCommentList(String songId,
      {int offset = 0, int limit = 20, int beforeTime = 0}) {
    var params = {
      'rid': songId,
      'limit': limit,
      'offset': offset,
      'beforeTime': beforeTime
    };
    return Https.dio
        .postUri(joinUri('/api/v1/resource/comments/R_SO_4_$songId'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
    });
  }

  /// 专辑评论
  Future<CommentListWrap> albumCommentList(String albumId,
      {int offset = 0, int limit = 20, int beforeTime = 0}) {
    var params = {
      'rid': albumId,
      'limit': limit,
      'offset': offset,
      'beforeTime': beforeTime
    };
    return Https.dio
        .postUri(joinUri('/weapi/v1/resource/comments/R_AL_3_$albumId'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
    });
  }

  /// 歌单评论
  Future<CommentListWrap> playlistCommentList(String pid,
      {int offset = 0, int limit = 20, int beforeTime = 0}) {
    var params = {
      'rid': pid,
      'limit': limit,
      'offset': offset,
      'beforeTime': beforeTime
    };
    return Https.dio
        .postUri(joinUri('/weapi/v1/resource/comments/A_PL_0_$pid'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
    });
  }

  /// mv评论
  Future<CommentListWrap> mvCommentList(String mvId,
      {int offset = 0, int limit = 20, int beforeTime = 0}) {
    var params = {
      'rid': mvId,
      'limit': limit,
      'offset': offset,
      'beforeTime': beforeTime
    };
    return Https.dio
        .postUri(joinUri('/weapi/v1/resource/comments/R_MV_5_$mvId'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
    });
  }

  /// 电台评论
  Future<CommentListWrap> djRadioCommentList(String radioId,
      {int offset = 0, int limit = 20, int beforeTime = 0}) {
    var params = {
      'rid': radioId,
      'limit': limit,
      'offset': offset,
      'beforeTime': beforeTime
    };
    return Https.dio
        .postUri(joinUri('/weapi/v1/resource/comments/A_DJ_1_$radioId'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
    });
  }

  /// 视频评论
  Future<CommentListWrap> videoCommentList(String videoId,
      {int offset = 0, int limit = 20, int beforeTime = 0}) {
    var params = {
      'rid': videoId,
      'limit': limit,
      'offset': offset,
      'beforeTime': beforeTime
    };
    return Https.dio
        .postUri(joinUri('/weapi/v1/resource/comments/R_VI_62_$videoId'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
    });
  }

  /// 热门评论
  /// [id] 资源id
  /// [type] 'song':歌曲 'mv':mv 'playlist':歌单 'album':专辑 'dj':电台 'video':视频
  Future<CommentListWrap> hotCommentList(String id, String type,
      {int offset = 0, int limit = 20, int beforeTime = 0}) {
    String typeKey = _type2key(type);
    var params = {
      'rid': id,
      'limit': limit,
      'offset': offset,
      'beforeTime': beforeTime
    };
    return Https.dio
        .postUri(joinUri('/weapi/v1/resource/hotcomments/$typeKey$id'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
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

  /// 通知 - 评论
  /// !需要登录
  Future<CommentListWrap> userComments(String userId,
      {int beforeTime = -1, int limit = 30, bool total = true}) {
    var params = {
      'uid': userId,
      'limit': limit,
      'beforeTime': beforeTime,
      'total': total
    };
    return Https.dio
        .postUri(joinUri('/api/v1/user/comments/$userId'),
            data: params, options: joinOptions())
        .then((Response value) {
      return CommentListWrap.fromJson(value.data);
    });
  }

  /// 通知 - @我
  /// !需要登录
  /// TODO 账号没有这类数据，补充数据结构  forwards
  Future<ServerStatusBean> forwards(
      {int offset = 0, int limit = 30, bool total = true}) {
    var params = {'limit': limit, 'offset': offset, 'total': total};
    return Https.dio
        .postUri(joinUri('/api/forwards/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 评论点赞
  /// !需要登录
  /// [id] 资源id
  /// [commentId 评论id
  /// 注意： 动态点赞不需要传入 id 参数，需要传入动态的 threadId 参数,
  /// 如：/comment/like?type=6&cid=1419532712&threadId=A_EV_2_6559519868_32953014&t=0，
  /// threadId 可通过 /event，/user/event 接口获取
  Future<ServerStatusBean> likeComment(
      String id, String commentId, String type, bool like,
      {String threadId}) {
    String typeKey = _type2key(type);
    var params = {'commentId': commentId, 'threadId': typeKey + id};
    if (type == 'event') {
      if (threadId == null) {
        return Future.error(ArgumentError('event type, threadId not null'));
      }
      params['threadId'] = threadId;
    }
    return Https.dio
        .postUri(joinUri('/weapi/v1/comment/${like ? 'like' : 'unlike'}'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 发表/删除/回复评论
  /// [id] 资源id
  /// [op] 'add':发表  'delete':删除  'reply':回复
  /// 注意： 动态点赞不需要传入 id 参数，需要传入动态的 threadId 参数,
  /// 如：/comment/like?type=6&cid=1419532712&threadId=A_EV_2_6559519868_32953014&t=0，
  /// threadId 可通过 /event，/user/event 接口获取
  Future<CommentWrap> comment(String id, String type, String op,
      {String commentId, String threadId, String content}) {
    String typeKey = _type2key(type);
    var params = {'threadId': typeKey + id};
    if (type == 'event') {
      if (threadId == null) {
        return Future.error(ArgumentError('event type, threadId not null'));
      }
      params['threadId'] = threadId;
    }
    switch (op) {
      case 'add':
        if (content == null) {
          return Future.error(ArgumentError('add op, content not null'));
        }
        params['content'] = content;
        break;
      case 'delete':
        if (commentId == null) {
          return Future.error(ArgumentError('delete op, commentId not null'));
        }
        params['commentId'] = commentId;
        break;
      case 'reply':
        if (commentId == null) {
          return Future.error(ArgumentError('reply op, commentId not null'));
        }
        if (content == null) {
          return Future.error(ArgumentError('reply op, content not null'));
        }
        params['commentId'] = commentId;
        params['content'] = content;
        break;
    }
    return Https.dio
        .postUri(joinUri('/weapi/resource/comments/$op'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return CommentWrap.fromJson(value.data);
    });
  }

  /// 点赞与取消点赞资源
  /// !需要登录
  /// [id] 资源id
  /// 注意： 动态点赞不需要传入 id 参数，需要传入动态的 threadId 参数,
  /// 如：/comment/like?type=6&cid=1419532712&threadId=A_EV_2_6559519868_32953014&t=0，
  /// threadId 可通过 /event，/user/event 接口获取
  Future<ServerStatusBean> likeResource(String id, String type, bool like,
      {String commentId, String threadId, String content}) {
    String typeKey = _type2key(type);
    var params = {'threadId': typeKey + id};
    if (type == 'event') {
      if (threadId == null) {
        return Future.error(ArgumentError('event type, threadId not null'));
      }
      params['threadId'] = threadId;
    }
    return Https.dio
        .postUri(joinUri('/weapi/resource/${like ? 'like' : 'unlike'}'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  String _type2key(String type) {
    String typeKey = 'R_SO_4_';
    switch (type) {
      case 'song':
        typeKey = 'R_SO_4_';
        break;
      case 'mv':
        typeKey = 'R_MV_5_';
        break;
      case 'playlist':
        typeKey = 'A_PL_0_';
        break;
      case 'album':
        typeKey = 'R_AL_3_';
        break;
      case 'dj':
        typeKey = 'A_DJ_1_';
        break;
      case 'video':
        typeKey = 'R_VI_62_';
        break;
      case 'event':
        typeKey = 'A_EV_2_';
        break;
    }
    return typeKey;
  }

  /// 私信会话列表
  /// !需要登录
  Future<UsersMsgListWrap> privateMsgListUsers(
      {int offset = 0, int limit = 30, bool total = true}) {
    var params = {'limit': limit, 'offset': offset, 'total': total};
    return Https.dio
        .postUri(joinUri('/api/msg/private/users'),
            data: params, options: joinOptions())
        .then((Response value) {
      return UsersMsgListWrap.fromJson(value.data);
    });
  }

  /// 发送私信（返回与这个用户的历史信息）
  /// !需要登录
  Future<UserMsgListWrap2> sendPrivateMsg(String msg, String userId,
      {String type = 'text', String playlist = ''}) {
    var params = {
      'userIds': '[$userId]',
      'id': playlist,
      'msg': msg,
      'type': type
    };
    return Https.dio
        .postUri(joinUri('/weapi/msg/private/send'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return UserMsgListWrap2.fromJson(value.data);
    });
  }

  /// 私信内容(与某个用户的私信)
  /// !需要登录
  Future<UserMsgListWrap> privateMsgListUser(String userId,
      {int offset = 0, int limit = 30, bool total = true}) {
    var params = {
      'userId': userId,
      'limit': limit,
      'offset': offset,
      'total': total
    };
    return Https.dio
        .postUri(joinUri('/api/msg/private/history'),
            data: params, options: joinOptions())
        .then((Response value) {
      return UserMsgListWrap.fromJson(value.data);
    });
  }

  /// 通知
  /// !需要登录
  /// TODO 账号没有这类数据，补充数据结构  notices
  Future<ServerStatusBean> msgNotices({int limit = 30, int lasttime = -1}) {
    var params = {'limit': limit, 'lasttime ': lasttime};
    return Https.dio
        .postUri(joinUri('/api/msg/notices'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }
}
