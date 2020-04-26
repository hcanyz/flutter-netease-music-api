// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Music _$MusicFromJson(Map<String, dynamic> json) {
  return Music()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..size = json['size'] as int
    ..extension = json['extension'] as String
    ..sr = json['sr'] as int
    ..dfsId = json['dfsId'] as int
    ..bitrate = json['bitrate'] as int
    ..playTime = json['playTime'] as int
    ..volumeDelta = (json['volumeDelta'] as num)?.toDouble();
}

Map<String, dynamic> _$MusicToJson(Music instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'extension': instance.extension,
      'sr': instance.sr,
      'dfsId': instance.dfsId,
      'bitrate': instance.bitrate,
      'playTime': instance.playTime,
      'volumeDelta': instance.volumeDelta,
    };

Privilege _$PrivilegeFromJson(Map<String, dynamic> json) {
  return Privilege()
    ..id = dynamicToString(json['id'])
    ..fee = json['fee'] as int
    ..payed = json['payed'] as int
    ..st = json['st'] as int
    ..pl = json['pl'] as int
    ..dl = json['dl'] as int
    ..sp = json['sp'] as int
    ..cp = json['cp'] as int
    ..subp = json['subp'] as int
    ..cs = json['cs'] as bool
    ..maxbr = json['maxbr'] as int
    ..fl = json['fl'] as int
    ..toast = json['toast'] as bool
    ..flag = json['flag'] as int
    ..preSell = json['preSell'] as bool;
}

Map<String, dynamic> _$PrivilegeToJson(Privilege instance) => <String, dynamic>{
      'id': instance.id,
      'fee': instance.fee,
      'payed': instance.payed,
      'st': instance.st,
      'pl': instance.pl,
      'dl': instance.dl,
      'sp': instance.sp,
      'cp': instance.cp,
      'subp': instance.subp,
      'cs': instance.cs,
      'maxbr': instance.maxbr,
      'fl': instance.fl,
      'toast': instance.toast,
      'flag': instance.flag,
      'preSell': instance.preSell,
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) {
  return Artists()
    ..id = dynamicToString(json['id'])
    ..accountId = dynamicToString(json['accountId'])
    ..name = json['name'] as String
    ..picUrl = json['picUrl'] as String
    ..img1v1Id = json['img1v1Id'] as int
    ..albumSize = json['albumSize'] as int
    ..musicSize = json['musicSize'] as int
    ..topicPerson = json['topicPerson'] as int
    ..trans = json['trans'] as String
    ..briefDesc = json['briefDesc'] as String
    ..followed = json['followed'] as bool;
}

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'img1v1Id': instance.img1v1Id,
      'albumSize': instance.albumSize,
      'musicSize': instance.musicSize,
      'topicPerson': instance.topicPerson,
      'trans': instance.trans,
      'briefDesc': instance.briefDesc,
      'followed': instance.followed,
    };

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..subType = json['subType'] as String
    ..size = json['size'] as int
    ..picUrl = json['picUrl'] as String
    ..tags = json['tags'] as String
    ..companyId = json['companyId'] as int
    ..company = json['company'] as String
    ..description = json['description'] as String
    ..briefDesc = json['briefDesc'] as String
    ..artist = json['artist'] == null
        ? null
        : Artists.fromJson(json['artist'] as Map<String, dynamic>)
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'subType': instance.subType,
      'size': instance.size,
      'picUrl': instance.picUrl,
      'tags': instance.tags,
      'companyId': instance.companyId,
      'company': instance.company,
      'description': instance.description,
      'briefDesc': instance.briefDesc,
      'artist': instance.artist,
      'artists': instance.artists,
    };

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..copyrightId = json['copyrightId'] as int
    ..disc = json['disc'] as String
    ..no = json['no'] as int
    ..fee = json['fee'] as int
    ..status = json['status'] as int
    ..starred = json['starred'] as bool
    ..starredNum = json['starredNum'] as int
    ..popularity = (json['popularity'] as num)?.toDouble()
    ..score = json['score'] as int
    ..duration = json['duration'] as int
    ..playedNum = json['playedNum'] as int
    ..dayPlays = json['dayPlays'] as int
    ..hearTime = json['hearTime'] as int
    ..ringtone = json['ringtone'] as String
    ..copyFrom = json['copyFrom'] as String
    ..commentThreadId = json['commentThreadId'] as String
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..album = json['album'] == null
        ? null
        : Album.fromJson(json['album'] as Map<String, dynamic>)
    ..privilege = json['privilege'] == null
        ? null
        : Privilege.fromJson(json['privilege'] as Map<String, dynamic>)
    ..copyright = json['copyright'] as int
    ..transName = json['transName'] as String
    ..mark = json['mark'] as int
    ..rtype = json['rtype'] as int
    ..mvid = json['mvid'] as int
    ..alg = json['alg'] as String
    ..reason = json['reason'] as String
    ..hMusic = json['hMusic'] == null
        ? null
        : Music.fromJson(json['hMusic'] as Map<String, dynamic>)
    ..mMusic = json['mMusic'] == null
        ? null
        : Music.fromJson(json['mMusic'] as Map<String, dynamic>)
    ..lMusic = json['lMusic'] == null
        ? null
        : Music.fromJson(json['lMusic'] as Map<String, dynamic>)
    ..bMusic = json['bMusic'] == null
        ? null
        : Music.fromJson(json['bMusic'] as Map<String, dynamic>)
    ..noCopyrightRcmd = json['noCopyrightRcmd'] as String;
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'copyrightId': instance.copyrightId,
      'disc': instance.disc,
      'no': instance.no,
      'fee': instance.fee,
      'status': instance.status,
      'starred': instance.starred,
      'starredNum': instance.starredNum,
      'popularity': instance.popularity,
      'score': instance.score,
      'duration': instance.duration,
      'playedNum': instance.playedNum,
      'dayPlays': instance.dayPlays,
      'hearTime': instance.hearTime,
      'ringtone': instance.ringtone,
      'copyFrom': instance.copyFrom,
      'commentThreadId': instance.commentThreadId,
      'artists': instance.artists,
      'album': instance.album,
      'privilege': instance.privilege,
      'copyright': instance.copyright,
      'transName': instance.transName,
      'mark': instance.mark,
      'rtype': instance.rtype,
      'mvid': instance.mvid,
      'alg': instance.alg,
      'reason': instance.reason,
      'hMusic': instance.hMusic,
      'mMusic': instance.mMusic,
      'lMusic': instance.lMusic,
      'bMusic': instance.bMusic,
      'noCopyrightRcmd': instance.noCopyrightRcmd,
    };

Song2 _$Song2FromJson(Map<String, dynamic> json) {
  return Song2()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..pst = json['pst'] as int
    ..t = json['t'] as int
    ..pop = (json['pop'] as num)?.toDouble()
    ..st = json['st'] as int
    ..rt = json['rt'] as String
    ..fee = json['fee'] as int
    ..v = json['v'] as int
    ..cf = json['cf'] as String
    ..dt = json['dt'] as int
    ..privilege = json['privilege'] == null
        ? null
        : Privilege.fromJson(json['privilege'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Song2ToJson(Song2 instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pst': instance.pst,
      't': instance.t,
      'pop': instance.pop,
      'st': instance.st,
      'rt': instance.rt,
      'fee': instance.fee,
      'v': instance.v,
      'cf': instance.cf,
      'dt': instance.dt,
      'privilege': instance.privilege,
    };

PlayItem _$PlayItemFromJson(Map<String, dynamic> json) {
  return PlayItem()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..coverImgUrl = json['coverImgUrl'] as String
    ..tag = json['tag'] as String
    ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
    ..copywriter = json['copywriter'] as String
    ..createTime = json['createTime'] as int
    ..updateTime = json['updateTime'] as int
    ..playCount = json['playCount'] as int
    ..subscribedCount = json['subscribedCount'] as int
    ..shareCount = json['shareCount'] as int
    ..commentCount = json['commentCount'] as int
    ..trackCount = json['trackCount'] as int
    ..trackNumberUpdateTime = json['trackNumberUpdateTime'] as int
    ..commentThreadId = json['commentThreadId'] as String
    ..specialType = json['specialType'] as int
    ..creator = json['creator'] == null
        ? null
        : PlayListCreator.fromJson(json['creator'] as Map<String, dynamic>)
    ..subscribers = (json['subscribers'] as List)
        ?.map((e) => e == null
            ? null
            : PlayListSubscriber.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PlayItemToJson(PlayItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'coverImgUrl': instance.coverImgUrl,
      'tag': instance.tag,
      'tags': instance.tags,
      'copywriter': instance.copywriter,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'playCount': instance.playCount,
      'subscribedCount': instance.subscribedCount,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'trackCount': instance.trackCount,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'commentThreadId': instance.commentThreadId,
      'specialType': instance.specialType,
      'creator': instance.creator,
      'subscribers': instance.subscribers,
    };

MultiPlayListWrap _$MultiPlayListWrapFromJson(Map<String, dynamic> json) {
  return MultiPlayListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..playlists = (json['playlists'] as List)
        ?.map((e) =>
            e == null ? null : PlayItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MultiPlayListWrapToJson(MultiPlayListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'playlists': instance.playlists,
    };

MultiPlayListWrap2 _$MultiPlayListWrap2FromJson(Map<String, dynamic> json) {
  return MultiPlayListWrap2()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..playlist = (json['playlist'] as List)
        ?.map((e) =>
            e == null ? null : PlayItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MultiPlayListWrap2ToJson(MultiPlayListWrap2 instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'playlist': instance.playlist,
    };

PlaylistCatalogueItem _$PlaylistCatalogueItemFromJson(
    Map<String, dynamic> json) {
  return PlaylistCatalogueItem()
    ..name = json['name'] as String
    ..resourceCount = json['resourceCount'] as int
    ..imgUrl = json['imgUrl'] as String
    ..type = json['type'] as int
    ..category = json['category'] as int
    ..resourceType = json['resourceType'] as int
    ..hot = json['hot'] as bool
    ..activity = json['activity'] as bool;
}

Map<String, dynamic> _$PlaylistCatalogueItemToJson(
        PlaylistCatalogueItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'resourceCount': instance.resourceCount,
      'imgUrl': instance.imgUrl,
      'type': instance.type,
      'category': instance.category,
      'resourceType': instance.resourceType,
      'hot': instance.hot,
      'activity': instance.activity,
    };

PlaylistCatalogueWrap _$PlaylistCatalogueWrapFromJson(
    Map<String, dynamic> json) {
  return PlaylistCatalogueWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..all = json['all'] == null
        ? null
        : PlaylistCatalogueItem.fromJson(json['all'] as Map<String, dynamic>)
    ..sub = (json['sub'] as List)
        ?.map((e) => e == null
            ? null
            : PlaylistCatalogueItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..categories = (json['categories'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    );
}

Map<String, dynamic> _$PlaylistCatalogueWrapToJson(
        PlaylistCatalogueWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'all': instance.all,
      'sub': instance.sub,
      'categories':
          instance.categories?.map((k, e) => MapEntry(k.toString(), e)),
    };

PlaylistHotTag _$PlaylistHotTagFromJson(Map<String, dynamic> json) {
  return PlaylistHotTag()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..category = json['category'] as int
    ..usedCount = json['usedCount'] as int
    ..type = json['type'] as int
    ..position = json['position'] as int
    ..highQuality = json['highQuality'] as int
    ..highQualityPos = json['highQualityPos'] as int
    ..officialPos = json['officialPos'] as int
    ..createTime = json['createTime'] as int;
}

Map<String, dynamic> _$PlaylistHotTagToJson(PlaylistHotTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'usedCount': instance.usedCount,
      'type': instance.type,
      'position': instance.position,
      'highQuality': instance.highQuality,
      'highQualityPos': instance.highQualityPos,
      'officialPos': instance.officialPos,
      'createTime': instance.createTime,
    };

PlaylistHotTagsItem _$PlaylistHotTagsItemFromJson(Map<String, dynamic> json) {
  return PlaylistHotTagsItem()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..activity = json['activity'] as bool
    ..hot = json['hot'] as bool
    ..position = json['position'] as int
    ..category = json['category'] as int
    ..createTime = json['createTime'] as int
    ..type = json['type'] as int
    ..playlistTag = json['playlistTag'] == null
        ? null
        : PlaylistHotTag.fromJson(json['playlistTag'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PlaylistHotTagsItemToJson(
        PlaylistHotTagsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'activity': instance.activity,
      'hot': instance.hot,
      'position': instance.position,
      'category': instance.category,
      'createTime': instance.createTime,
      'type': instance.type,
      'playlistTag': instance.playlistTag,
    };

PlaylistHotTagsWrap _$PlaylistHotTagsWrapFromJson(Map<String, dynamic> json) {
  return PlaylistHotTagsWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..tags = (json['tags'] as List)
        ?.map((e) => e == null
            ? null
            : PlaylistHotTagsItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PlaylistHotTagsWrapToJson(
        PlaylistHotTagsWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'tags': instance.tags,
    };

SinglePlayListWrap _$SinglePlayListWrapFromJson(Map<String, dynamic> json) {
  return SinglePlayListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..playlist = json['playlist'] == null
        ? null
        : PlayItem.fromJson(json['playlist'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SinglePlayListWrapToJson(SinglePlayListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'playlist': instance.playlist,
    };

RecommendSongListWrap _$RecommendSongListWrapFromJson(
    Map<String, dynamic> json) {
  return RecommendSongListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..recommend = (json['recommend'] as List)
        ?.map(
            (e) => e == null ? null : Song.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RecommendSongListWrapToJson(
        RecommendSongListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'recommend': instance.recommend,
    };

PlaymodeIntelligenceItem _$PlaymodeIntelligenceItemFromJson(
    Map<String, dynamic> json) {
  return PlaymodeIntelligenceItem()
    ..id = dynamicToString(json['id'])
    ..recommended = json['recommended'] as bool
    ..alg = json['alg'] as String
    ..songInfo = json['songInfo'] == null
        ? null
        : Song.fromJson(json['songInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PlaymodeIntelligenceItemToJson(
        PlaymodeIntelligenceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recommended': instance.recommended,
      'alg': instance.alg,
      'songInfo': instance.songInfo,
    };

PlaymodeIntelligenceListWrap _$PlaymodeIntelligenceListWrapFromJson(
    Map<String, dynamic> json) {
  return PlaymodeIntelligenceListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : PlaymodeIntelligenceItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PlaymodeIntelligenceListWrapToJson(
        PlaymodeIntelligenceListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'data': instance.data,
    };

ArtistsListWrap _$ArtistsListWrapFromJson(Map<String, dynamic> json) {
  return ArtistsListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ArtistsListWrapToJson(ArtistsListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'artists': instance.artists,
    };

ArtistTopSongList _$ArtistTopSongListFromJson(Map<String, dynamic> json) {
  return ArtistTopSongList()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..songs = (json['songs'] as List)
        ?.map(
            (e) => e == null ? null : Song2.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ArtistTopSongListToJson(ArtistTopSongList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'songs': instance.songs,
    };
