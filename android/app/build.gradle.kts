plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    // Match iOS bundle id để tester có cùng identifier khi reinstall.
    namespace = "app.guop.guHrMobile"
    // compileSdk 36: nhiều plugin (camera, core 1.18) yêu cầu API 35+ để compile.
    // targetSdk vẫn 34 (Android 14 stable) để không thay đổi runtime behavior.
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // Core library desugaring required by flutter_local_notifications +
        // các plugin xài Java 8+ time API trên Android < API 26.
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "app.guop.guHrMobile"
        // Min SDK 24 (Android 7+) — cover 95%+ devices VN, đủ cho HR app.
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0.0"
        multiDexEnabled = true
    }

    buildTypes {
        release {
            // Internal distribution: ký bằng debug keystore (không cần Play upload key).
            // Khi naik Play Store thực sự sẽ tạo upload key riêng.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
