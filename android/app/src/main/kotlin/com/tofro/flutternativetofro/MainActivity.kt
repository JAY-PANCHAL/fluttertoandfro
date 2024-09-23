package com.tofro.flutternativetofro

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    var channelname = "nativetoflutter";


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        var chanel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelname)
        chanel.setMethodCallHandler { call, result ->
            if (call.method == "getcolor") {
                result.success("0xff60e95D")
            } else if (call.method == "sendColor") {
                if (call.hasArgument("color")) {
                    result.success(call.argument("color"))
                } else {
                    result.success("0xff60e95D")
                }
            }
        }
    }


}
