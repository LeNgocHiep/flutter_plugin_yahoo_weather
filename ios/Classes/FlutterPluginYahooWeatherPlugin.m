#import "FlutterPluginYahooWeatherPlugin.h"
#if __has_include(<flutter_plugin_yahoo_weather/flutter_plugin_yahoo_weather-Swift.h>)
#import <flutter_plugin_yahoo_weather/flutter_plugin_yahoo_weather-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_plugin_yahoo_weather-Swift.h"
#endif

@implementation FlutterPluginYahooWeatherPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPluginYahooWeatherPlugin registerWithRegistrar:registrar];
}
@end
