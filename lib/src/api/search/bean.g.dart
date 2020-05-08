// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSongWrap _$SearchSongWrapFromJson(Map<String, dynamic> json) {
  return SearchSongWrap()
    ..songs = (json['songs'] as List)
        ?.map(
            (e) => e == null ? null : Song.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchSongWrapToJson(SearchSongWrap instance) =>
    <String, dynamic>{
      'songs': instance.songs,
    };

SearchSongWrapX _$SearchSongWrapXFromJson(Map<String, dynamic> json) {
  return SearchSongWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchSongWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchSongWrapXToJson(SearchSongWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchAlbumsWrap _$SearchAlbumsWrapFromJson(Map<String, dynamic> json) {
  return SearchAlbumsWrap()
    ..albums = (json['albums'] as List)
        ?.map(
            (e) => e == null ? null : Album.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchAlbumsWrapToJson(SearchAlbumsWrap instance) =>
    <String, dynamic>{
      'albums': instance.albums,
    };

SearchAlbumsWrapX _$SearchAlbumsWrapXFromJson(Map<String, dynamic> json) {
  return SearchAlbumsWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchAlbumsWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchAlbumsWrapXToJson(SearchAlbumsWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchArtistsWrap _$SearchArtistsWrapFromJson(Map<String, dynamic> json) {
  return SearchArtistsWrap()
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchArtistsWrapToJson(SearchArtistsWrap instance) =>
    <String, dynamic>{
      'artists': instance.artists,
    };

SearchArtistsWrapX _$SearchArtistsWrapXFromJson(Map<String, dynamic> json) {
  return SearchArtistsWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchArtistsWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchArtistsWrapXToJson(SearchArtistsWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchPlaylistWrap _$SearchPlaylistWrapFromJson(Map<String, dynamic> json) {
  return SearchPlaylistWrap()
    ..playlists = (json['playlists'] as List)
        ?.map((e) =>
            e == null ? null : PlayItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchPlaylistWrapToJson(SearchPlaylistWrap instance) =>
    <String, dynamic>{
      'playlists': instance.playlists,
    };

SearchPlaylistWrapX _$SearchPlaylistWrapXFromJson(Map<String, dynamic> json) {
  return SearchPlaylistWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchPlaylistWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchPlaylistWrapXToJson(
        SearchPlaylistWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchUserWrapX _$SearchUserWrapXFromJson(Map<String, dynamic> json) {
  return SearchUserWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : UserListWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchUserWrapXToJson(SearchUserWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchMvWrapX _$SearchMvWrapXFromJson(Map<String, dynamic> json) {
  return SearchMvWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : MvListWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchMvWrapXToJson(SearchMvWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchLyricsWrap _$SearchLyricsWrapFromJson(Map<String, dynamic> json) {
  return SearchLyricsWrap()
    ..songs = (json['songs'] as List)
        ?.map(
            (e) => e == null ? null : Song.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchLyricsWrapToJson(SearchLyricsWrap instance) =>
    <String, dynamic>{
      'songs': instance.songs,
    };

SearchLyricsWrapX _$SearchLyricsWrapXFromJson(Map<String, dynamic> json) {
  return SearchLyricsWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchLyricsWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchLyricsWrapXToJson(SearchLyricsWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchDjradiorap _$SearchDjradiorapFromJson(Map<String, dynamic> json) {
  return SearchDjradiorap()
    ..djRadios = (json['djRadios'] as List)
        ?.map((e) => e == null ? null : Dj.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchDjradiorapToJson(SearchDjradiorap instance) =>
    <String, dynamic>{
      'djRadios': instance.djRadios,
    };

SearchDjradioWrapX _$SearchDjradioWrapXFromJson(Map<String, dynamic> json) {
  return SearchDjradioWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchDjradiorap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchDjradioWrapXToJson(SearchDjradioWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchVideoWrap _$SearchVideoWrapFromJson(Map<String, dynamic> json) {
  return SearchVideoWrap()
    ..videos = (json['videos'] as List)
        ?.map((e) => e == null ? null : Mv2.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchVideoWrapToJson(SearchVideoWrap instance) =>
    <String, dynamic>{
      'videos': instance.videos,
    };

SearchVideoWrapX _$SearchVideoWrapXFromJson(Map<String, dynamic> json) {
  return SearchVideoWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchVideoWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchVideoWrapXToJson(SearchVideoWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchComplexSong _$SearchComplexSongFromJson(Map<String, dynamic> json) {
  return SearchComplexSong()
    ..songs = (json['songs'] as List)
        ?.map(
            (e) => e == null ? null : Song.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..moreText = json['moreText'] as String
    ..highText = json['highText'] as String
    ..more = json['more'] as bool
    ..resourceIds =
        (json['resourceIds'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$SearchComplexSongToJson(SearchComplexSong instance) =>
    <String, dynamic>{
      'songs': instance.songs,
      'moreText': instance.moreText,
      'highText': instance.highText,
      'more': instance.more,
      'resourceIds': instance.resourceIds,
    };

SearchComplexMlog _$SearchComplexMlogFromJson(Map<String, dynamic> json) {
  return SearchComplexMlog()
    ..moreText = json['moreText'] as String
    ..more = json['more'] as bool
    ..resourceIds =
        (json['resourceIds'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$SearchComplexMlogToJson(SearchComplexMlog instance) =>
    <String, dynamic>{
      'moreText': instance.moreText,
      'more': instance.more,
      'resourceIds': instance.resourceIds,
    };

SearchComplexPlaylist _$SearchComplexPlaylistFromJson(
    Map<String, dynamic> json) {
  return SearchComplexPlaylist()
    ..playLists = (json['playLists'] as List)
        ?.map((e) =>
            e == null ? null : PlayItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..moreText = json['moreText'] as String
    ..highText = json['highText'] as String
    ..more = json['more'] as bool
    ..resourceIds =
        (json['resourceIds'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$SearchComplexPlaylistToJson(
        SearchComplexPlaylist instance) =>
    <String, dynamic>{
      'playLists': instance.playLists,
      'moreText': instance.moreText,
      'highText': instance.highText,
      'more': instance.more,
      'resourceIds': instance.resourceIds,
    };

SearchComplexArtist _$SearchComplexArtistFromJson(Map<String, dynamic> json) {
  return SearchComplexArtist()
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..moreText = json['moreText'] as String
    ..highText = json['highText'] as String
    ..more = json['more'] as bool
    ..resourceIds =
        (json['resourceIds'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$SearchComplexArtistToJson(
        SearchComplexArtist instance) =>
    <String, dynamic>{
      'artists': instance.artists,
      'moreText': instance.moreText,
      'highText': instance.highText,
      'more': instance.more,
      'resourceIds': instance.resourceIds,
    };

SearchComplexAlbum _$SearchComplexAlbumFromJson(Map<String, dynamic> json) {
  return SearchComplexAlbum()
    ..albums = (json['albums'] as List)
        ?.map(
            (e) => e == null ? null : Album.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..moreText = json['moreText'] as String
    ..highText = json['highText'] as String
    ..more = json['more'] as bool
    ..resourceIds =
        (json['resourceIds'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$SearchComplexAlbumToJson(SearchComplexAlbum instance) =>
    <String, dynamic>{
      'albums': instance.albums,
      'moreText': instance.moreText,
      'highText': instance.highText,
      'more': instance.more,
      'resourceIds': instance.resourceIds,
    };

SearchComplexWrap _$SearchComplexWrapFromJson(Map<String, dynamic> json) {
  return SearchComplexWrap()
    ..song = json['song'] == null
        ? null
        : SearchComplexSong.fromJson(json['song'] as Map<String, dynamic>)
    ..mlog = json['mlog'] == null
        ? null
        : SearchComplexMlog.fromJson(json['mlog'] as Map<String, dynamic>)
    ..playList = json['playList'] == null
        ? null
        : SearchComplexPlaylist.fromJson(
            json['playList'] as Map<String, dynamic>)
    ..artist = json['artist'] == null
        ? null
        : SearchComplexArtist.fromJson(json['artist'] as Map<String, dynamic>)
    ..album = json['album'] == null
        ? null
        : SearchComplexAlbum.fromJson(json['album'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchComplexWrapToJson(SearchComplexWrap instance) =>
    <String, dynamic>{
      'song': instance.song,
      'mlog': instance.mlog,
      'playList': instance.playList,
      'artist': instance.artist,
      'album': instance.album,
    };

SearchComplexWrapX _$SearchComplexWrapXFromJson(Map<String, dynamic> json) {
  return SearchComplexWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchComplexWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchComplexWrapXToJson(SearchComplexWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchKey _$SearchKeyFromJson(Map<String, dynamic> json) {
  return SearchKey()
    ..showKeyword = json['showKeyword'] as String
    ..action = json['action'] as int
    ..realkeyword = json['realkeyword'] as String
    ..searchType = json['searchType'] as int
    ..alg = json['alg'] as String
    ..gap = json['gap'] as int;
}

Map<String, dynamic> _$SearchKeyToJson(SearchKey instance) => <String, dynamic>{
      'showKeyword': instance.showKeyword,
      'action': instance.action,
      'realkeyword': instance.realkeyword,
      'searchType': instance.searchType,
      'alg': instance.alg,
      'gap': instance.gap,
    };

SearchKeyWrap _$SearchKeyWrapFromJson(Map<String, dynamic> json) {
  return SearchKeyWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : SearchKey.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchKeyWrapToJson(SearchKeyWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'data': instance.data,
    };

SearchHotKey _$SearchHotKeyFromJson(Map<String, dynamic> json) {
  return SearchHotKey()
    ..first = json['first'] as String
    ..second = json['second'] as int
    ..iconType = json['iconType'] as int;
}

Map<String, dynamic> _$SearchHotKeyToJson(SearchHotKey instance) =>
    <String, dynamic>{
      'first': instance.first,
      'second': instance.second,
      'iconType': instance.iconType,
    };

SearchHotKeyWrap _$SearchHotKeyWrapFromJson(Map<String, dynamic> json) {
  return SearchHotKeyWrap()
    ..hots = (json['hots'] as List)
        ?.map((e) =>
            e == null ? null : SearchHotKey.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchHotKeyWrapToJson(SearchHotKeyWrap instance) =>
    <String, dynamic>{
      'hots': instance.hots,
    };

SearchKeyWrapX _$SearchKeyWrapXFromJson(Map<String, dynamic> json) {
  return SearchKeyWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchHotKeyWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchKeyWrapXToJson(SearchKeyWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchKeyDetailedItem _$SearchKeyDetailedItemFromJson(
    Map<String, dynamic> json) {
  return SearchKeyDetailedItem()
    ..searchWord = json['searchWord'] as String
    ..content = json['content'] as String
    ..iconUrl = json['iconUrl'] as String
    ..url = json['url'] as String
    ..alg = json['alg'] as String
    ..score = json['score'] as int
    ..source = json['source'] as int
    ..iconType = json['iconType'] as int;
}

Map<String, dynamic> _$SearchKeyDetailedItemToJson(
        SearchKeyDetailedItem instance) =>
    <String, dynamic>{
      'searchWord': instance.searchWord,
      'content': instance.content,
      'iconUrl': instance.iconUrl,
      'url': instance.url,
      'alg': instance.alg,
      'score': instance.score,
      'source': instance.source,
      'iconType': instance.iconType,
    };

SearchKeyDetailedWrap _$SearchKeyDetailedWrapFromJson(
    Map<String, dynamic> json) {
  return SearchKeyDetailedWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SearchKeyDetailedItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchKeyDetailedWrapToJson(
        SearchKeyDetailedWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'data': instance.data,
    };

SearchSuggestItem _$SearchSuggestItemFromJson(Map<String, dynamic> json) {
  return SearchSuggestItem()
    ..keyword = json['keyword'] as String
    ..type = json['type'] as int
    ..alg = json['alg'] as String
    ..lastKeyword = json['lastKeyword'] as String;
}

Map<String, dynamic> _$SearchSuggestItemToJson(SearchSuggestItem instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'type': instance.type,
      'alg': instance.alg,
      'lastKeyword': instance.lastKeyword,
    };

SearchSuggestWrap _$SearchSuggestWrapFromJson(Map<String, dynamic> json) {
  return SearchSuggestWrap()
    ..allMatch = (json['allMatch'] as List)
        ?.map((e) => e == null
            ? null
            : SearchSuggestItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchSuggestWrapToJson(SearchSuggestWrap instance) =>
    <String, dynamic>{
      'allMatch': instance.allMatch,
    };

SearchSuggestWrapX _$SearchSuggestWrapXFromJson(Map<String, dynamic> json) {
  return SearchSuggestWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchSuggestWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchSuggestWrapXToJson(SearchSuggestWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchMultiMatchWrap _$SearchMultiMatchWrapFromJson(Map<String, dynamic> json) {
  return SearchMultiMatchWrap()
    ..song = (json['song'] as List)
        ?.map(
            (e) => e == null ? null : Song.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..playList = (json['playList'] as List)
        ?.map((e) =>
            e == null ? null : PlayItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..artist = (json['artist'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..album = (json['album'] as List)
        ?.map(
            (e) => e == null ? null : Album.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..orders = (json['orders'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$SearchMultiMatchWrapToJson(
        SearchMultiMatchWrap instance) =>
    <String, dynamic>{
      'song': instance.song,
      'playList': instance.playList,
      'artist': instance.artist,
      'album': instance.album,
      'orders': instance.orders,
    };

SearchMultiMatchWrapX _$SearchMultiMatchWrapXFromJson(
    Map<String, dynamic> json) {
  return SearchMultiMatchWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchMultiMatchWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchMultiMatchWrapXToJson(
        SearchMultiMatchWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };
