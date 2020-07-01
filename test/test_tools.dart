import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pointycastle/export.dart';

void main() async {
  test('_testEncryptEApiReqBody', () async {
    print(_testEncryptEApiReqBody('/api/song/enhance/player/url/v1', {
      "ids": "[\"554241732_0\",\"1372796676_0\"]",
      "level": "higher",
      "header": "{}",
      "e_r": "true"
    }));
  });
  test('_testDecodeEApiReqBody', () async {
    print(_testDecodeEApiReqBody(
        'params=FA90B329E9614F79E79598F37DC2EDB487F00D1BC4C9B24CD57E6C318B9073569338432CD7D98D1A3626E997A2C531210C358EEB12B65A2C76E4A574735B2B13AED36B1C970A234F122C76248C5ECA3C6196B6EB0223FD195D6746F0374AB5E4B0ED1DC9A3059D901846DC4C812EEDE113D9424A98EE8040E7DD051B2E365D5C90DF91DB4056B9981CA2C1C98D09C97D53735006FD471F3A7885B57C0F826CBBCC3AFA76C7EB953C7A1B06A9477C4178EA5E941E139E3C1D0B531C523FB748A390C1D94191EA5AE1F96343CC1557CEE3'));
  });
}

String _testEncryptEApiReqBody(String eApiUrl, Map dataMap) {
  var body = jsonEncode(dataMap);
  var message = 'nobody${eApiUrl}use${body}md5forencrypt';
  var digest =
      Encrypted(MD5Digest().process(Uint8List.fromList(utf8.encode(message))))
          .base16;
  var data = '$eApiUrl-36cd479b6b5-$body-36cd479b6b5-$digest';

  final encrypted =
      Encrypter(AES(Key.fromUtf8('e82ckenh8dichen8'), mode: AESMode.ecb))
          .encrypt(data)
          .base16
          .toUpperCase();

  return 'params=${Uri.encodeComponent(encrypted)}';
}

String _testDecodeEApiReqBody(String body) {
  var query = Uri(query: body).queryParameters;

  var params = query['params'];

  if (params == null || params.isEmpty) {
    return '';
  }

  return _decryptEApiReqBody(params);
}

String _decryptEApiReqBody(String params) {
  return Encrypter(AES(Key.fromUtf8('e82ckenh8dichen8'), mode: AESMode.ecb))
      .decrypt16(Uri.decodeComponent(params));
}
