import Flutter
import UIKit

public class SwiftFlutterPluginYahooWeatherPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_plugin_yahoo_weather", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPluginYahooWeatherPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
