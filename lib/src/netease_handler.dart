import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart' hide Key;

import 'encrypt_ext.dart';

void neteaseInterceptor(RequestOptions option) {
  //TODO 区分调用
  _handleLinuxForward(option);
  _handleWebApi(option);
}

const _BASE62 =
    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
const String _presetKeyLinuxForward = 'rFgB&h#%2?^eDg:Q';

void _handleLinuxForward(RequestOptions option) {
  option.contentType = 'application/x-www-form-urlencoded';

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

const _presetKeyWebApi = '0CoJUm6Qyw8W8jud';
const _ivWebApi = '0102030405060708';
const _publicKeyWebApi =
    '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDgtQn2JZ34ZC28NWYpAUd98iZ37BUrX/aKzmFbt7clFSs6sXqHauqKWqdtLkF2KexO40H1YTX8z2lSgBBOAxLsvaklV8k4cBFK9snQXE9/DDaFt6Rr7iVZMldczhC0JNgTz+SHXT6CBHuX3e9SdB1Ua44oncaTWz7OBGLbCiK45wIDAQAB\n-----END PUBLIC KEY-----';

void _handleWebApi(RequestOptions option) {
  option.contentType = 'application/x-www-form-urlencoded';

  String body = jsonEncode(option.data);

  //1. 固定密钥加密原始数据
  final key = Key.fromUtf8(_presetKeyWebApi);
  final iv = IV.fromUtf8(_ivWebApi);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final encrypted = encrypter.encrypt(body, iv: iv);
  debugPrint(encrypted.bytes.toString());

  //2. 生成一个16位密钥A
  Uint8List randomKeyBytes = Uint8List.fromList(List.generate(16, (int index) {
    return _BASE62.codeUnitAt(Random().nextInt(62));
  }));

  //3. 用密钥A再次加密
  final key2 = Key(randomKeyBytes);
  final encrypterBody = Encrypter(AES(key2, mode: AESMode.cbc));
  final encryptedBody = encrypterBody.encrypt(encrypted.base64, iv: iv);

  //4. RSA加密密钥A
  final parser = RSAKeyParser();
  final encrypter3 =
      Encrypter(RSAExt(publicKey: parser.parse(_publicKeyWebApi)));
  final encrypted3 =
      encrypter3.encryptBytes(List.from(randomKeyBytes.reversed));

  //5. 组合结果
  option.data =
      'params=${Uri.encodeQueryComponent(encryptedBody.base64)}&encSecKey=${Uri.encodeQueryComponent(encrypted3.base16)}';
}
