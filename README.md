# Datacine Mobile App

[![Datacine](https://github.com/C4co/datacine/actions/workflows/dart.yml/badge.svg)](https://github.com/C4co/datacine/actions/workflows/dart.yml)

Aplicativo móvel desenvolvido em Flutter para consulta e acompanhamento de filmes, séries e personalidades utilizando a API do The Movie Database (TMDB).

---

## 📋 Pré-requisitos

- **Flutter**: `>= 3.47.0`
- **Dart**: `>= 3.13.0 < 4.0.0`
- **Java**: OpenJDK 17 ou superior (Gradle 9.1 / AGP 8.11)

---

## 🔑 Configuração de API Keys

Crie ou certifique-se de que o arquivo `api-keys.json` está na raiz do projeto com o seu token de leitura v4 do TMDB:

```json
{
  "TMDB_AUTH_TOKEN_V4": "YOUR_TMDB_READ_ACCESS_TOKEN"
}
```

---

## 🚀 Como Executar

### Desenvolvimento local

```bash
flutter run --dart-define-from-file=api-keys.json
```

Para rodar em um dispositivo ou emulador específico:

```bash
flutter devices
flutter run -d <DEVICE_ID> --dart-define-from-file=api-keys.json
```

---

## 🛠️ Comandos de Desenvolvimento

### Geradores de código (Build Runner)

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Ícones do aplicativo

```bash
dart run flutter_launcher_icons
```

### Splash Screen

```bash
dart run flutter_native_splash:create
```

### Análise de código e Lint

```bash
flutter analyze
```

### Testes automatizados

```bash
flutter test --dart-define-from-file=api-keys.json
```

---

## 📦 Build para Produção (Android)

### Gerar APK

```bash
flutter build apk --dart-define-from-file=api-keys.json
```

### Gerar App Bundle (.aab)

```bash
flutter build appbundle --dart-define-from-file=api-keys.json
```

---

## 👨‍💻 Autor

[Carlos Costa](https://github.com/C4co)
