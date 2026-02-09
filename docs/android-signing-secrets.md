# Android APK imzalama (GitHub Secrets)

Bu proje workflow içinde isteğe bağlı olarak Android release APK imzalayabilir.
İmzalama adımı yalnızca `ANDROID_KEYSTORE_BASE64` secret değeri tanımlıysa çalışır.

## Gerekli GitHub Secrets

Repo > **Settings** > **Secrets and variables** > **Actions** bölümüne aşağıdaki secret'ları ekleyin:

- `ANDROID_KEYSTORE_BASE64`: Keystore dosyanızın (`.jks` / `.keystore`) Base64 çıktısı.
- `ANDROID_KEYSTORE_PASSWORD`: Keystore şifresi.
- `ANDROID_KEY_ALIAS`: Keystore içindeki key alias adı.
- `ANDROID_KEY_PASSWORD`: İlgili key'in şifresi.

## Keystore'u Base64'e çevirme

macOS / Linux:

```bash
base64 -w 0 android/upload-keystore.jks
```

> `-w 0` parametresi çıktıyı tek satıra indirir. Üretilen çıktıyı `ANDROID_KEYSTORE_BASE64` secret'ına yapıştırın.

## Flutter/Android tarafında beklenen yapı

Workflow, aşağıdaki dosyaları otomatik üretir:

- `android/upload-keystore.jks`
- `android/key.properties`

`android/app/build.gradle` (veya `build.gradle.kts`) dosyanızın `key.properties` dosyasını okuyup `release` signingConfig'e bağlandığından emin olun.

## Güvenlik notları

- Keystore dosyasını repoya commit etmeyin.
- Secret değerlerini loglara yazdırmayın.
- Keystore parolaları ve alias bilgilerini yalnızca GitHub Secrets üzerinden yönetin.
