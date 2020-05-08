import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'bean.dart';

mixin ApiPlay {
  /// 歌单分类
  Future<PlaylistCatalogueWrap> playlistCatalogue() {
    return Https.dio
        .postUri(joinUri('/weapi/playlist/catalogue'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return PlaylistCatalogueWrap.fromJson(value.data);
    });
  }

  /// 热门歌单tags
  Future<PlaylistHotTagsWrap> playlistHotTags() {
    return Https.dio
        .postUri(joinUri('/weapi/playlist/hottags'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return PlaylistHotTagsWrap.fromJson(value.data);
    });
  }

  /// 精品歌单
  /// [category] tag, 比如 " 华语 "、" 古风 " 、" 欧美 "、" 流行 ", 默认为 "全部",可从歌单分类接口获取[playlistCatalogue]
  Future<MultiPlayListWrap> highqualityPlayList(
      {String category = '全部',
      int limit = 30,
      bool total = true,
      int lastTime = 0}) {
    var params = {
      'cat': category,
      'limit': limit,
      'lastTime': lastTime,
      'total': total
    };
    return Https.dio
        .postUri(joinUri('/weapi/playlist/highquality/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return MultiPlayListWrap.fromJson(value.data);
    });
  }

  /// 歌曲相关歌单列表
  /// [songId] 歌曲id
  Future<MultiPlayListWrap> relatedPlayList(String songId) {
    return Https.dio
        .getUri(joinUri('/playlist?id=$songId'),
            options: joinOptions(userAgent: UserAgent.Pc))
        .then((Response value) {
      var listWrap = MultiPlayListWrap();
      listWrap.code = RET_CODE_OK;
      listWrap.playlists = [];
      try {
        const pattern =
            r'<div class="cver u-cover u-cover-3">[\s\S]*?<img src="([^"]+)">[\s\S]*?<a class="sname f-fs1 s-fc0" href="([^"]+)"[^>]*>([^<]+?)<\/a>[\s\S]*?<a class="nm nm f-thide s-fc3" href="([^"]+)"[^>]*>([^<]+?)<\/a>';
        var matchs = RegExp(pattern, multiLine: true).allMatches(value.data);
        for (var match in matchs) {
          try {
            var item = Play();
            item.id = match.group(2).substring('/playlist?id='.length);
            item.name = match.group(3);
            item.coverImgUrl = match
                .group(1)
                .substring(0, match.group(1).length - '?param=50y50'.length);
            item.creator = NeteaseUserInfo();
            item.creator.userId =
                match.group(4).substring('/user/home?id='.length);
            item.creator.nickname = match.group(5);
            listWrap.playlists.add(item);
          } catch (ignore) {}
        }
      } catch (e) {
        listWrap.code = RET_CODE_UNKNOW;
      }
      return listWrap;
    });
  }

  /// 每日推荐歌单
  Future<RecommendPlayListWrap> recommendPlaylist() {
    return Https.dio
        .postUri(joinUri('/weapi/v1/discovery/recommend/resource'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return RecommendPlayListWrap.fromJson(value.data);
    });
  }

  /// 心动模式/智能播放
  /// [songId]  歌曲 id
  /// [playlistId]  歌单 id
  /// [startMusicId]  要开始播放的歌曲的 id
  Future<PlaymodeIntelligenceListWrap> playmodeIntelligenceList(
      String songId, String playlistId,
      {String startMusicId, int count = 1}) {
    var params = {
      'songId': songId,
      'type': 'fromPlayOne',
      'playlistId': playlistId,
      'startMusicId': startMusicId ?? songId,
      'count': count
    };
    return Https.dio
        .postUri(joinUri('/weapi/playmode/intelligence/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return PlaymodeIntelligenceListWrap.fromJson(value.data);
    });
  }

  /// 歌单详情
  /// [songId] 歌曲 id
  Future<MultiPlayListWrap> playListSimi(String songId,
      {int offset = 0, int limit = 30}) {
    var params = {'songid': songId, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/discovery/simiPlaylist'),
            data: params, options: joinOptions())
        .then((Response value) {
      return MultiPlayListWrap.fromJson(value.data);
    });
  }

  /// 歌单详情
  /// https://binaryify.github.io/NeteaseCloudMusicApi/#/?id=%e8%8e%b7%e5%8f%96%e6%ad%8c%e5%8d%95%e8%af%a6%e6%83%85
  /// [categoryId] 可从歌单分类接口获取[playlistCatalogue]
  Future<SinglePlayListWrap> playListDetail(String categoryId,
      {int subCount = 8}) {
    var params = {'id': categoryId, 'n': 1000, 's': subCount};
    return Https.dio
        .postUri(joinUri('/weapi/v3/playlist/detail'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SinglePlayListWrap.fromJson(value.data);
    });
  }

  /// 分类歌单歌曲列表
  /// [category] tag, 比如 " 华语 "、" 古风 " 、" 欧美 "、" 流行 ", 默认为 "全部",可从歌单分类接口获取[playlistCatalogue]
  /// [order] 'new':最新  'hot':最热 默认为 'hot'
  Future<MultiPlayListWrap> categorySongList({
    String category = '全部',
    String order = 'hot',
    int offset = 0,
    int limit = 30,
    bool total = true,
  }) {
    var params = {
      'cat': category,
      'order': order,
      'total': total,
      'limit': limit,
      'offset': offset
    };
    return Https.dio
        .postUri(joinUri('/weapi/playlist/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return MultiPlayListWrap.fromJson(value.data);
    });
  }

  /// 推荐音乐列表
  Future<RecommendSongListWrap> recommendSongList(
      {int offset = 0, int limit = 30}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/v1/discovery/recommend/songs'),
            data: params, options: joinOptions())
        .then((Response value) {
      return RecommendSongListWrap.fromJson(value.data);
    });
  }

  /// 新歌速递
  /// [areaId] 全部:0 华语:7 欧美:96 日本:8 韩国:16 默认0
  Future<NewSongListWrap> newSongList({String areaId = '0'}) {
    var params = {'areaId': areaId, 'total': true};
    return Https.dio
        .postUri(joinUri('/weapi/v1/discovery/new/songs'),
            data: params, options: joinOptions())
        .then((Response value) {
      return NewSongListWrap.fromJson(value.data);
    });
  }

  /// 最近5个听了这首歌的用户
  Future<UserListWrap> userSongSimi(String songId) {
    var params = {'songid': songId};
    return Https.dio
        .postUri(joinUri('/weapi/discovery/simiUser'),
            data: params, options: joinOptions())
        .then((Response value) {
      return UserListWrap.fromJson(value.data);
    });
  }

  /// 相似mv
  Future<SongListWrap> songSimi(String songId,
      {int offset = 0, int limit = 30}) {
    var params = {'songid': songId, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/v1/discovery/simiSong'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SongListWrap.fromJson(value.data);
    });
  }

  /// 音乐详情
  Future<SongDetailWrap> songDetail(List<String> songIds) {
    var params = {
      'ids': songIds,
      'c': songIds.map((e) => jsonEncode({'id': e})).toList()
    };
    return Https.dio
        .postUri(joinUri('/weapi/v3/song/detail'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SongDetailWrap.fromJson(value.data);
    });
  }

  /// 音乐url
  /// https://binaryify.github.io/NeteaseCloudMusicApi/#/?id=%e8%8e%b7%e5%8f%96%e9%9f%b3%e4%b9%90-url
  /// 注 : 部分用户反馈获取的 url 会 403,hwaphon找到的 解决方案是当获取到音乐的 id 后，将 https://music.163.com/song/media/outer/url?id=id.mp3 以 src 赋予 Audio 即可播放
  /// [br] 码率,默认设置了 999000 即最大码率,如果要 320k 则可设置为 320000,其他类推
  Future<SongUrlListWrap> songUrl(List<String> songIds, {int br = 999000}) {
    var params = {'ids': songIds, 'br': br};
    return Https.dio
        .postUri(joinUri('/api/song/enhance/player/url'),
            data: params,
            options: joinOptions(
                encryptType: EncryptType.LinuxForward, cookies: {'os': 'pc'}))
        .then((Response value) {
      return SongUrlListWrap.fromJson(value.data);
    });
  }

  /// 音乐歌词
  Future<SongLyricWrap> songLyric(String songId) {
    var params = {'id': songId, 'lv': -1, 'kv': -1, 'tv': -1};
    return Https.dio
        .postUri(joinUri('/api/song/lyric'),
            data: params,
            options: joinOptions(
                encryptType: EncryptType.LinuxForward, cookies: {'os': 'pc'}))
        .then((Response value) {
      return SongLyricWrap.fromJson(value.data);
    });
  }

  /// 音乐是否可用
  /// [br] 码率,默认设置了 999000 即最大码率,如果要 320k 则可设置为 320000,其他类推
  /// [SongUrlListWrap.code] 200
  Future<SongUrlListWrap> songAvailableCheck(List<String> songIds,
      {int br = 999000}) {
    var params = {'ids': songIds, 'br': br};
    return Https.dio
        .postUri(joinUri('/weapi/song/enhance/player/url'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SongUrlListWrap.fromJson(value.data);
    });
  }

  /// 分类 歌手列表
  /// [type]   -1:全部 1:男歌手 2:女歌手 3:乐队
  /// [area]   -1:全部 7:华语 96:欧美 8:日本 16:韩国 0:其他
  /// [initial] 取值 a-z/A-Z
  Future<ArtistsListWrap> artistList(int initial,
      {int offset = 0,
      int limit = 30,
      bool total = true,
      int type = 1,
      int area = -1}) {
    var params = {
      'initial': initial,
      'type': type,
      'area': area,
      'total': total,
      'limit': limit,
      'offset': offset
    };
    return Https.dio
        .postUri(joinUri('/api/v1/artist/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ArtistsListWrap.fromJson(value.data);
    });
  }

  /// 相似mv
  Future<MvListWrap> mvSimi(String mvId) {
    var params = {'mvid': mvId};
    return Https.dio
        .postUri(joinUri('/weapi/discovery/simiMV'),
            data: params, options: joinOptions())
        .then((Response value) {
      return MvListWrap.fromJson(value.data);
    });
  }

  /// 相似歌手
  Future<ArtistsListWrap> artistSimi(String artistId) {
    var params = {'artistid': artistId};
    return Https.dio
        .postUri(joinUri('/weapi/discovery/simiArtist'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ArtistsListWrap.fromJson(value.data);
    });
  }

  /// 歌手介绍
  Future<ArtistDescWrap> artistDesc(String artistId) {
    var params = {'id': artistId};
    return Https.dio
        .postUri(joinUri('/weapi/artist/introduction'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ArtistDescWrap.fromJson(value.data);
    });
  }

  /// 歌手热门50首歌曲
  Future<ArtistTopSongListWrap> artistTopSongList(String artistId) {
    var params = {'id': artistId};
    return Https.dio
        .postUri(joinUri('/api/artist/top/song'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ArtistTopSongListWrap.fromJson(value.data);
    });
  }

  /// 歌手信息+歌曲
  Future<ArtistSongListWrap> artistSongList(String artistId) {
    return Https.dio
        .postUri(joinUri('/weapi/v1/artist/$artistId'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return ArtistSongListWrap.fromJson(value.data);
    });
  }

  /// 歌手MV列表
  Future<ArtistMvListWrap> artistMvList(String artistId,
      {int offset = 0, int limit = 30, bool total = true}) {
    var params = {
      'artistId': artistId,
      'total': total,
      'limit': limit,
      'offset': offset
    };
    return Https.dio
        .postUri(joinUri('/weapi/artist/mvs'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ArtistMvListWrap.fromJson(value.data);
    });
  }

  /// 歌手专辑列表
  Future<ArtistAlbumListWrap> artistAlbumList(String artistId,
      {int offset = 0, int limit = 30, bool total = true}) {
    var params = {'total': total, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/artist/albums/$artistId'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ArtistAlbumListWrap.fromJson(value.data);
    });
  }

  /// 专辑详情
  Future<AlbumDetailWrap> albumDetail(String albumId) {
    return Https.dio
        .postUri(joinUri('/weapi/v1/album/$albumId'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return AlbumDetailWrap.fromJson(value.data);
    });
  }

  /// 专辑动态信息
  Future<AlbumDetailDynamicWrap> albumDetailDynamic(String albumId) {
    var params = {'id': albumId};
    return Https.dio
        .postUri(joinUri('/api/album/detail/dynamic'),
            data: params, options: joinOptions())
        .then((Response value) {
      return AlbumDetailDynamicWrap.fromJson(value.data);
    });
  }
}
