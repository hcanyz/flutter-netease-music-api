# 登录模块 API 说明文档

## 功能概述
登录模块提供了完整的用户认证功能，包括手机号登录、邮箱登录、二维码登录等多种登录方式，以及验证码、注册等相关功能。

## API 详细说明

### 手机号登录
```dart
Future<NeteaseAccountInfoWrap> loginCellPhone(
    String phone,
    String password,
    {String countryCode = ''}
)
```
**参数说明：**
- `phone`: 手机号码
- `password`: 已经过 MD5 加密的密码
- `countryCode`: 国家区号（可选，默认为空）

**返回值：**
- `NeteaseAccountInfoWrap`: 包含用户账号信息的对象

### 邮箱登录
```dart
Future<NeteaseAccountInfoWrap> loginEmail(
    String email,
    String password
)
```
**参数说明：**
- `email`: 邮箱地址
- `password`: 已经过 MD5 加密的密码

### 二维码登录
```dart
// 1. 获取二维码 key
Future<QrCodeLoginKey> loginQrCodeKey()

// 2. 获取二维码图片 URL
String loginQrCodeUrl(String key)

// 3. 检查二维码状态
Future<ServerStatusBean> loginQrCodeCheck(String key)
```

### 验证码相关
```dart
// 发送验证码
Future<ServerStatusBean> captchaSend(
    String phone,
    {String ctcode = '86'}
)

// 验证验证码
Future<ServerStatusBean> captchaVerify(
    String phone,
    String captcha,
    {String ctcode = '86'}
)
```

### 注册账号
```dart
Future<ServerStatusBean> registerCellPhone(
    String phone,
    String password,
    String captcha,
    {String nickname = ''}
)
```
**参数说明：**
- `phone`: 手机号码
- `password`: 已经过 MD5 加密的密码
- `captcha`: 验证码
- `nickname`: 昵称（可选）

### 退出登录
```dart
Future<ServerStatusBean> logout()
```

## 使用示例

```dart
final api = NeteaseMusicApi();

// 手机号登录
await api.loginCellPhone('13800138000', md5Password);

// 发送验证码
await api.captchaSend('13800138000');

// 使用二维码登录
final qrKey = await api.loginQrCodeKey();
final qrUrl = api.loginQrCodeUrl(qrKey.unikey);
// 定期检查扫码状态
final status = await api.loginQrCodeCheck(qrKey.unikey);

// 退出登录
await api.logout();
```

## 错误码说明

- `RET_CODE_OK`: 操作成功
- `RET_CODE_NEED_LOGIN`: 需要登录
- `RET_CODE_INVALID_PASSWORD`: 密码错误
- `RET_CODE_ACCOUNT_NOT_EXISTS`: 账号不存在

## 注意事项

1. 密码传入前需要先进行 MD5 加密
2. 登录成功后会自动保存登录状态
3. 部分接口需要先进行登录才能调用
4. 验证码发送有频率限制，请合理使用
