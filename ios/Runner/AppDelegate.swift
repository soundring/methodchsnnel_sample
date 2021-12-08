import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let _controller = window?.rootViewController as! FlutterViewController
    // MethodChannelで通信チャンネルを作成。引数の文字列はDart側と同じにする。
    let _channel = FlutterMethodChannel(
      name: "com.murasame.methodchannelSample/sample",
      binaryMessenger: _controller.binaryMessenger)
    
    _channel.setMethodCallHandler({
         (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        // call.methodに、Dart側のinvokeMethodの第1引数の文字列が格納されているため、それを見て適切な処理を行う
        guard call.method == "fetchDeviceInfo" else {
            result(FlutterMethodNotImplemented)
            return
           }
        // Dart側のinvokeMethodの第2引数は、methodCall.argumentから取得出来る
        let parameters = call.arguments as! String
        self.receiveDeviceInfo(name: parameters, result: result)
       })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func receiveDeviceInfo(name: String ,result: FlutterResult) {
     let device = UIDevice.current
     let text = """
            \(name)さんのデバイス情報
            \(device.name)
            \(device.systemName)
            \(device.systemVersion)
        """
      // Dart側に結果を返す
      result(text)
    }
}


