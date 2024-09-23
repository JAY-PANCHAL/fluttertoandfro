import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      let channel = FlutterMethodChannel(name: "nativetoflutter", binaryMessenger: controller as! FlutterBinaryMessenger)
        
      channel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          if call.method == "getcolor" {
            result("0xff60e95D")
          } else if call.method=="sendColor" {
              if let args = call.arguments as? Dictionary<String, Any>,
                  let color = args["color"] as? String {
                    // please check the "as" above  - wasn't able to test
                    // handle the method

                  result(color)
              } else {
                  result("0xff60e95D")
              }
          } else {
            result(FlutterMethodNotImplemented)
          }
          })
      
      //   9
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
