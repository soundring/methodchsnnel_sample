import 'package:pigeon/pigeon.dart';

// 引数の定義
class DeviceInfoRequest {
  String text;
}

// 戻り値の定義
class DeviceInfoReply {
  String deviceInfoText;
}

@HostApi()
abstract class DeviceInfoApi {
  DeviceInfoReply fetchDeviceInfo(DeviceInfoRequest req);
}

//下記コマンドを実行してファイルを生成
// flutter pub run pigeon \
// --input pigeon/schema.dart \
// --dart_out lib/pigeon.dart \
// --objc_header_out ios/Runner/pigeon.h \
// --objc_source_out ios/Runner/pigeon.m \
// --java_out ./android/app/src/main/java/dev/flutter/pigeon/Pigeon.java \
// --java_package "io.flutter.plugins"

// iOSの場合
// 生成されたpigeon.hとpigeon.mをXcodeプロジェクトにドラックアンドドロップで追加する
