# stealth_frontend

A YouTube Creator Analytics Dashboard that displays earnings data, featuring social authentication and cloud infrastructure.

## Packages Used
### Authentication Packages
- [firebase_ui_auth: ^1.16.1](https://pub.dev/packages/firebase_ui_auth)
- [firebase_core: ^3.10.1](https://pub.dev/packages/firebase_core)
- [firebase_auth: ^5.4.1](https://pub.dev/packages/firebase_auth)
- [firebase_storage: ^12.4.1](https://pub.dev/packages/firebase_storage)
- [cloud_firestore: ^5.6.2](https://pub.dev/packages/cloud_firestore)
- [google_sign_in: ^6.2.2](https://pub.dev/packages/google_sign_in)
- [firebase_ui_oauth_google: ^1.4.1](https://pub.dev/packages/firebase_ui_oauth_google)
- [firebase_ui_oauth_apple: ^1.3.1](https://pub.dev/packages/firebase_ui_oauth_apple)
- [flutter_facebook_auth: ^7.1.1](https://pub.dev/packages/flutter_facebook_auth)
- [firebase_ui_oauth_facebook: ^1.3.1](https://pub.dev/packages/firebase_ui_oauth_facebook)

### Notifications Packages
- [firebase_messaging: ^15.2.1](https://pub.dev/packages/firebase_messaging)

### Rename Packages
- [rename: ^3.0.2](https://pub.dev/packages/rename)

### Cache Manager
- [flutter_cache_manager: ^3.4.1](https://pub.dev/packages/flutter_cache_manager)
- [cached_network_image: ^3.4.1](https://pub.dev/packages/cached_network_image)

### Image Modification Packages
- [image_cropper: ^8.1.0](https://pub.dev/packages/image_cropper)
- [image_picker: ^1.1.2](https://pub.dev/packages/image_picker)
- [image_picker_for_web: ^3.0.6](https://pub.dev/packages/image_picker_for_web)
- [flutter_image_compress: ^2.4.0](https://pub.dev/packages/flutter_image_compress)
- [path_provider: ^2.1.5](https://pub.dev/packages/path_provider)

### Chart Packages
- [fl_chart: ^0.70.2](https://pub.dev/packages/fl_chart)

### gRPC & Protobuf Packages
- [grpc: ^4.0.1](https://pub.dev/packages/grpc)
- [protobuf: ^3.1.0](https://pub.dev/packages/protobuf)
- [build_runner: ^2.4.14](https://pub.dev/packages/build_runner)

### Video Calling Packages
- [permission_handler: ^11.3.1](https://pub.dev/packages/permission_handler)
- [zego_uikit_prebuilt_call: ^4.16.21](https://pub.dev/packages/zego_uikit_prebuilt_call)
- [zego_uikit_signaling_plugin: ^2.8.9](https://pub.dev/packages/zego_uikit_signaling_plugin)
- 
### Quality of life Packages
- [provider: ^6.1.2](https://pub.dev/packages/provider)
- [flutter_dotenv: ^5.2.1](https://pub.dev/packages/flutter_dotenv)

## Getting Started
### Creating Proto files
1. health.proto
```bash
protoc --dart_out=grpc:lib/generated -I=lib/proto lib/proto/health.proto
```
2. timestamp.proto
```bash
protoc --dart_out=grpc:lib/generated/google/protobuf -I=lib/proto ./lib/proto/google/protobuf/timestamp.proto
```



Test User Credentials:
- Email: test@gmail.com
- Password: 123456