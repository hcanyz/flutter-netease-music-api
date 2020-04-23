import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart' hide Key;

import 'encrypt_ext.dart';

void neteaseInterceptor(RequestOptions option) {
  if (option.method == 'POST' &&
      HOST.contains(option.uri.host) &&
      option.extra["hookRequestDate"]) {
    if (option.extra["hookRequestDate"]) {
      debugPrint('$TAG   interceptor before: ${option.uri}   ${option.data}');

      option.contentType = 'application/x-www-form-urlencoded';
      option.headers['Referer'] = HOST;
      option.headers['User-Agent'] =
          _chooseUserAgent(option.extra['userAgent']);

      switch (option.extra["encryptType"]) {
        case EncryptType.LinuxForward:
          _handleLinuxForward(option);
          break;
        case EncryptType.WeApi:
          _handleWeApi(option);
          break;
        case EncryptType.EApi:
          _handleEApi(option);
          break;
      }
      debugPrint('$TAG   interceptor after: ${option.uri}   ${option.data}');
    }
  }
}

const _BASE62 =
    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
const String _presetKeyLinuxForward = 'rFgB&h#%2?^eDg:Q';

void _handleLinuxForward(RequestOptions option) {
  var oldUriStr = option.uri.toString();

  option.path = Uri(
          scheme: option.uri.scheme,
          host: option.uri.host,
          path: 'api/linux/forward')
      .toString();

  var newData = {
    'method': option.method,
    'url': oldUriStr.replaceAll(RegExp('\\w*api'), 'api'),
    'params': option.data
  };

  final key = Key.fromUtf8(_presetKeyLinuxForward);
  final encrypter = Encrypter(AES(key, mode: AESMode.ecb));
  final encrypted = encrypter.encrypt(jsonEncode(newData));

  option.data = 'eparams=${Uri.encodeQueryComponent(encrypted.base16)}';
}

const _presetKeyWeApi = '0CoJUm6Qyw8W8jud';
const _ivWeApi = '0102030405060708';
const _publicKeyWeApi =
    '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDgtQn2JZ34ZC28NWYpAUd98iZ37BUrX/aKzmFbt7clFSs6sXqHauqKWqdtLkF2KexO40H1YTX8z2lSgBBOAxLsvaklV8k4cBFK9snQXE9/DDaFt6Rr7iVZMldczhC0JNgTz+SHXT6CBHuX3e9SdB1Ua44oncaTWz7OBGLbCiK45wIDAQAB\n-----END PUBLIC KEY-----';

void _handleWeApi(RequestOptions option) {
  option.contentType = 'application/x-www-form-urlencoded';

  String body = jsonEncode(option.data);

  //1. 固定密钥加密原始数据
  final key = Key.fromUtf8(_presetKeyWeApi);
  final iv = IV.fromUtf8(_ivWeApi);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final encrypted = encrypter.encrypt(body, iv: iv);
  debugPrint(encrypted.bytes.toString());

  //2. 生成一个16位密钥A
  Uint8List randomKeyBytes = Uint8List.fromList(List.generate(16, (int index) {
    return _BASE62.codeUnitAt(Random().nextInt(62));
  }));

  //3. 用密钥A再次加密步骤1的结果
  final key2 = Key(randomKeyBytes);
  final encrypterBody = Encrypter(AES(key2, mode: AESMode.cbc));
  final encryptedBody = encrypterBody.encrypt(encrypted.base64, iv: iv);

  //4. RSA加密密钥A
  final parser = RSAKeyParser();
  final encrypter3 =
      Encrypter(RSAExt(publicKey: parser.parse(_publicKeyWeApi)));
  final encrypted3 =
      encrypter3.encryptBytes(List.from(randomKeyBytes.reversed));

  //5. 组合结果
  option.data =
      'params=${Uri.encodeQueryComponent(encryptedBody.base64)}&encSecKey=${Uri.encodeQueryComponent(encrypted3.base16)}';
}

void _handleEApi(RequestOptions option) {}

const String TAG = 'NeteaseMusicApi';
const String HOST = 'https://music.163.com';

enum EncryptType { LinuxForward, WeApi, EApi }

enum UserAgent { Random, Pc, Mobile }

const userAgentList = [
  'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1',
  'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1',
  'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Mobile Safari/537.36',
  'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Mobile Safari/537.36',
  'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 6 Build/LYZ28E) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Mobile Safari/537.36',
  'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89;GameHelper',
  'Mozilla/5.0 (iPhone; CPU iPhone OS 10_0 like Mac OS X) AppleWebKit/602.1.38 (KHTML, like Gecko) Version/10.0 Mobile/14A300 Safari/602.1',
  'Mozilla/5.0 (iPad; CPU OS 10_0 like Mac OS X) AppleWebKit/602.1.38 (KHTML, like Gecko) Version/10.0 Mobile/14A300 Safari/602.1',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:46.0) Gecko/20100101 Firefox/46.0',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.1.1 Safari/603.2.4',
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:46.0) Gecko/20100101 Firefox/46.0',
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36',
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/13.10586'
];

String _chooseUserAgent(UserAgent agent) {
  var random = Random();
  switch (agent) {
    case UserAgent.Random:
      return userAgentList[random.nextInt(userAgentList.length)];
    case UserAgent.Pc:
      return userAgentList[random.nextInt(5) + 8];
    case UserAgent.Mobile:
      return userAgentList[random.nextInt(7)];
  }
  return '';
}

Options joinOptions(
        {hookRequestDate = true,
        EncryptType encryptType = EncryptType.WeApi,
        UserAgent userAgent = UserAgent.Random}) =>
    Options(contentType: ContentType.json.value, extra: {
      'hookRequestDate': hookRequestDate,
      'encryptType': encryptType,
      'userAgent': userAgent
    });

Uri joinUri(String path) {
  return Uri.parse('$HOST$path');
}
