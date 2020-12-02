package com.safecert.flutter_plugin_yahoo_weather

import android.content.Context
import androidx.annotation.NonNull
import com.android.volley.Request
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FlutterPluginYahooWeatherPlugin */
class FlutterPluginYahooWeatherPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var context: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_plugin_yahoo_weather")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val requestManager = ExampleRequestManager.getInstance(context)
        val appId = call.argument<String>("APP_ID").toString()
        val consumerKey = call.argument<String>("CONSUMER_KEY").toString()
        val consumerSecretKey = call.argument<String>("CONSUMER_SECRET").toString()
        val requestUrl: String
        if (call.method == "getWeatherApi") {
            requestUrl = call.argument<String>("REQUEST_URL").toString()
            val request: ExampleRequest<Any?> = ExampleRequest(Request.Method.GET, { response: Any? ->
                result.success(response)
            }, { error ->
                result.success(error)
            }, appId, consumerKey, consumerSecretKey, requestUrl)
            requestManager.addToRequestQueue(request)
        } else {
            result.notImplemented()
        }
    }


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
