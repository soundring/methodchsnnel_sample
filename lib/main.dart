import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // MethodChannelで通信チャンネルを作成。
  // 引数に指定する文字列は他のアプリケーションと被らず、
  // 一意に決まるようにするために慣例で"アプリパッケージ名/チャンネル名"とするのが一般的。
  static const MethodChannel _channel =
      const MethodChannel('com.murasame.methodchannelSample/sample');

  String text = '初期値';

  @override
  Widget build(BuildContext context) {
    void _deviceInfo() async {
      String deviceInfoText;

      try {
        // 第一引数に呼び出したいメソッド名の文字列を指定。
        // 第二引数には呼び出しメソッドの引数に指定するデータを指定。
        // 型はプリミティブ型で使える型に制約あり。(https://api.flutter.dev/flutter/services/StandardMessageCodec-class.html)
        deviceInfoText = await _channel.invokeMethod('fetchDeviceInfo', 'ムラサメ');
      } on PlatformException catch (e) {
        deviceInfoText = "デバイス情報が取得できませんでした: '${e.message}'.";
      }

      setState(() {
        text = deviceInfoText;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('プラットフォームとの通信テスト'),
      ),
      body: Center(
        child: Text(text),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _deviceInfo,
        tooltip: 'DeviceInfo',
        child: const Icon(Icons.info_outline),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
