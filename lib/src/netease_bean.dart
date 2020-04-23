export 'package:netease_music_api/src/api/list/bean.dart';
export 'package:netease_music_api/src/api/login/bean.dart';
export 'package:netease_music_api/src/api/user/bean.dart';

const int RET_CODE_OK = 200;
const int RET_CODE_UNKNOW = -233;
const int RET_CODE_NEED_LOGIN = 301;
const int RET_CODE_ILLEGAL_ARGUMENT = 400;
const int RET_CODE_ACCOUNT_NOT_FOUND = 501;

enum RetCode { Ok, NeedLogin, IllegalArgument, UnKnow }

RetCode valueOfCode(int code) {
  switch (code) {
    case RET_CODE_OK:
      return RetCode.Ok;
    case RET_CODE_NEED_LOGIN:
      return RetCode.NeedLogin;
    case RET_CODE_ILLEGAL_ARGUMENT:
      return RetCode.IllegalArgument;
  }
  return RetCode.UnKnow;
}
