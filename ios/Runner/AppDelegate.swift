import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let _controller = window?.rootViewController as! FlutterViewController

    // Setupを呼ぶ
    DeviceInfoApiSetup(_controller.binaryMessenger, MyApi())

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    // 実装したクラスを作成
    class MyApi: NSObject, DeviceInfoApi {
        func fetchDeviceInfoReq(_ req: DeviceInfoRequest, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> DeviceInfoReply? {
            let reply = DeviceInfoReply()
            let deviceInfoText: String = receiveDeviceInfo(name: req.text!)
            reply.deviceInfoText = deviceInfoText
            return reply
        }
        
        private func receiveDeviceInfo(name: String) -> String {
         let device = UIDevice.current
         let text = """
                \(name)さんのデバイス情報
                \(device.name)
                \(device.systemName)
                \(device.systemVersion)
            """

          return text
        }
    }
}


