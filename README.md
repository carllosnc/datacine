# Datacine Mobile App

[![Datacine](https://github.com/C4co/datacine/actions/workflows/dart.yml/badge.svg)](https://github.com/C4co/datacine/actions/workflows/dart.yml)

Build runner

```
dart run build_runner build --delete-conflicting-outputs
```

Launcher icon

```
dart run flutter_launcher_icons
```

Splash

```
dart run flutter_native_splash:create
```

Build apk/app bundle

```
flutter build apk --dart-define-from-file=api-keys.json
flutter build appbundle --dart-define-from-file=api-keys.json
```

Tests

```
flutter test --dart-define-from-file=api-keys.json
```

---

[Carlos Costa](https://github.com/C4co)
