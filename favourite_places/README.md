# favourite_places

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

When you tap “Take Picture,” the `image_picker` plugin needs:

1. **Runtime permission** to use the camera
2. A proper **FileProvider** configuration on Android
3. The camera usage description on iOS

If any of those is missing, nothing will happen (or you’ll get a silent failure). Here’s how to fix it:

---

## 1. Android

### a) Add the camera permission

In your `android/app/src/main/AndroidManifest.xml`, _above_ the `<application>` tag add:

```xml
<uses-permission android:name="android.permission.CAMERA"/>
```

### b) Configure a FileProvider

Still in `AndroidManifest.xml`, _inside_ the `<application>` block add:

```xml
<provider
    android:name="androidx.core.content.FileProvider"
    android:authorities="${applicationId}.fileprovider"
    android:exported="false"
    android:grantUriPermissions="true">
  <meta-data
      android:name="android.support.FILE_PROVIDER_PATHS"
      android:resource="@xml/file_paths"/>
</provider>
```

Then create the file `android/app/src/main/res/xml/file_paths.xml` and put:

```xml
<?xml version="1.0" encoding="utf-8"?>
<paths xmlns:android="http://schemas.android.com/apk/res/android">
  <!-- this lets image_picker write to your app’s Pictures/ folder -->
  <external-files-path name="images" path="Pictures"/>
</paths>
```

### c) Make sure your `compileSdkVersion` is up‑to‑date

In `android/app/build.gradle`:

```gradle
android {
  compileSdkVersion 33   // or newer
  ...
}
```

---

## 2. iOS

In `ios/Runner/Info.plist`, add these keys so the OS will actually prompt the user:

```xml
<key>NSCameraUsageDescription</key>
<string>We need to use your camera to take a photo for your profile.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to select pictures.</string>
```

---

## 3. Flutter side sanity checks

- Make sure you have the latest `image_picker` in your `pubspec.yaml`:

  ```yaml
  dependencies:
    image_picker: ^0.8.7+3
  ```

- After changing native files, always run:

  ```
  flutter clean
  flutter pub get
  flutter run
  ```

- If you still see nothing, try printing any exceptions:

  ```dart
  void _takePicture() async {
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
      if (picked == null) return;
      setState(() => _selectedImage = File(picked.path));
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }
  ```

---

Once you’ve added the permission, provider, and Info.plist entries, tapping **Take Picture** should bring up the system camera UI. Let me know if you hit any other errors!
