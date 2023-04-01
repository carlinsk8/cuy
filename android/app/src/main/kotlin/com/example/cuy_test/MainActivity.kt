package com.example.cuy_test
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*

class MainActivity: FlutterActivity() {

    private val CHANNEL = "samples.flutter.dev/info"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            // This method is invoked on the main thread.
            if (call.method == "getInfoDevice") {
                val map = getInfoDevice()
                result.success(map)

            } else {
                result.notImplemented()
            }
        }
    }

    private fun getInfoDevice(): HashMap<String, Any?> {
        val map = hashMapOf<String, Any?>()

        val versionName = BuildConfig.VERSION_NAME
        val appId = BuildConfig.APPLICATION_ID
        val appLabel = context.applicationInfo.nonLocalizedLabel.toString()
        val model = android.os.Build.MODEL;
        val brand = android.os.Build.BRAND;
        val androidName = android.os.Build.VERSION.RELEASE
        val locale = Locale.getDefault().displayName

        map["versionName"] = versionName
        map["appId"] = appId
        map["appName"] = appLabel
        map["model"] = model
        map["brand"] = brand
        map["android"] = androidName
        map["locale"] = locale
        return map
    }


}
