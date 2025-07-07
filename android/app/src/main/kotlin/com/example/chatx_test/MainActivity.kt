package com.example.chatx_test

import android.os.Bundle
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        // ✅ ต้องเรียกก่อน super.onCreate()
        installSplashScreen()
        super.onCreate(savedInstanceState)
    }
}
