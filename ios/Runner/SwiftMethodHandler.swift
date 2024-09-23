//
//  SwiftMethodHandler.swift
//  Runner
//
//  Created by MindTech Solutions M2 on 21/08/24.
//

import Foundation
import Flutter

//public class SwiftMethodHandler: NSObject {
//  public static func register(with registrar: FlutterPluginRegistrar) {
//      let channel = FlutterMethodChannel(name: "nativetoflutter", binaryMessenger: registrar.messenger())
//    let instance = SwiftMethodHandler()
//
//      
//      // registrar.addMethodCallDelegate(instance, channel: channel)
//  }
//
//  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
//    if call.method == "getcolor" {
//      result(0xff60e95D)
//    } else if call.method=="sendColor" {
//        if let args = call.arguments as? Dictionary<String, Any>,
//            let color = args["color"] as? String {
//              // please check the "as" above  - wasn't able to test
//              // handle the method
//
//            result(color)
//        } else {
//            result("0xff60e95D")
//            
//        }
//    } else {
//      result(FlutterMethodNotImplemented)
//    }
//  }
//}
